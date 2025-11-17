# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Base::DecimalAttribute do
  describe "class configuration" do
    describe ".min and .max" do
      let(:test_decimal_class) do
        Class.new(described_class) do
          attribute_id "999"
          xml_tag "Test_Decimal"
          min(-100.5)
          max 100.5
        end
      end

      it "sets min value" do
        expect(test_decimal_class.min).to eq(-100.5)
      end

      it "sets max value" do
        expect(test_decimal_class.max).to eq(100.5)
      end

      it "converts min to float" do
        klass = Class.new(described_class)
        klass.min "50.5"
        expect(klass.min).to eq(50.5)
      end

      it "converts max to float" do
        klass = Class.new(described_class)
        klass.max "200.75"
        expect(klass.max).to eq(200.75)
      end

      it "returns nil when min not set" do
        klass = Class.new(described_class)
        expect(klass.min).to be_nil
      end

      it "returns nil when max not set" do
        klass = Class.new(described_class)
        expect(klass.max).to be_nil
      end
    end
  end

  describe "validation" do
    let(:test_decimal_class) do
      Class.new(described_class) do
        attribute_id "999"
        xml_tag "Test_Decimal"
        min(-100.0)
        max 100.0
      end
    end

    describe "type validation" do
      it "accepts float values" do
        instance = test_decimal_class.new(50.5)
        expect(instance.value).to eq(50.5)
      end

      it "accepts integer values" do
        instance = test_decimal_class.new(50)
        expect(instance.value).to eq(50)
      end

      it "accepts string that can be converted to float" do
        instance = test_decimal_class.new("50.5")
        expect(instance.value).to eq("50.5")
      end

      it "accepts integer strings" do
        instance = test_decimal_class.new("50")
        expect(instance.value).to eq("50")
      end

      it "rejects non-numeric strings" do
        instance = test_decimal_class.new("abc")
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/must be numeric/)
      end

      let(:test_class) { test_decimal_class }

      include_examples "an attribute that rejects invalid types", [
        ["arrays", [1.5, 2.5], /must be numeric/],
        ["hashes", {key: "value"}, /must be numeric/]
      ]
    end

    describe "range validation" do
      it "accepts value within range" do
        instance = test_decimal_class.new(50.5)
        expect(instance.value).to eq(50.5)
      end

      it "accepts value at min boundary" do
        instance = test_decimal_class.new(-100.0)
        expect(instance.value).to eq(-100.0)
      end

      it "accepts value at max boundary" do
        instance = test_decimal_class.new(100.0)
        expect(instance.value).to eq(100.0)
      end

      it "rejects value below min" do
        instance = test_decimal_class.new(-100.1)
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/less than minimum of -100.0/)
      end

      it "rejects value above max" do
        instance = test_decimal_class.new(100.1)
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/greater than maximum of 100.0/)
      end

      it "accepts zero" do
        instance = test_decimal_class.new(0.0)
        expect(instance.value).to eq(0.0)
      end

      it "accepts negative values when in range" do
        instance = test_decimal_class.new(-50.5)
        expect(instance.value).to eq(-50.5)
      end

      it "accepts very small decimals" do
        instance = test_decimal_class.new(0.001)
        expect(instance.value).to eq(0.001)
      end
    end

    describe "without min constraint" do
      let(:no_min_class) do
        Class.new(described_class) do
          attribute_id "888"
          xml_tag "No_Min_Decimal"
          max 100.0
        end
      end

      it "accepts any value below max" do
        instance = no_min_class.new(-999999.99)
        expect(instance.value).to eq(-999999.99)
      end

      it "still enforces max" do
        instance = no_min_class.new(100.1)
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/greater than maximum/)
      end
    end

    describe "without max constraint" do
      let(:no_max_class) do
        Class.new(described_class) do
          attribute_id "777"
          xml_tag "No_Max_Decimal"
          min(-100.0)
        end
      end

      it "accepts any value above min" do
        instance = no_max_class.new(999999.99)
        expect(instance.value).to eq(999999.99)
      end

      it "still enforces min" do
        instance = no_max_class.new(-100.1)
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/less than minimum/)
      end
    end

    describe "without any constraints" do
      let(:unlimited_class) do
        Class.new(described_class) do
          attribute_id "666"
          xml_tag "Unlimited_Decimal"
        end
      end

      it "accepts any numeric value" do
        instance = unlimited_class.new(999999.99)
        expect(instance.value).to eq(999999.99)
      end

      it "accepts large negative values" do
        instance = unlimited_class.new(-999999.99)
        expect(instance.value).to eq(-999999.99)
      end

      it "still validates type" do
        instance = unlimited_class.new("abc")
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/must be numeric/)
      end
    end

    describe "with nil value" do
      let(:test_class) { test_decimal_class }

      include_examples "an attribute with nil value handling"
    end

    describe "value assignment" do
      let(:test_class) { test_decimal_class }

      include_examples "an attribute with value assignment",
        50.5,
        100.1,
        /greater than maximum/

      it "allows changing to another valid value", alternate_valid_value: 75.25 do
        instance = test_decimal_class.new(50.5)
        instance.value = 75.25
        expect(instance.value).to eq(75.25)
      end
    end
  end

  describe "XML generation" do
    let(:test_decimal_class) do
      Class.new(described_class) do
        attribute_id "999"
        xml_tag "Test_Decimal"
        min 0.0
        max 1000.0
      end
    end

    let(:test_class) { test_decimal_class }

    include_examples "an attribute with XML generation",
      42.5,
      "Test_Decimal",
      "999"

    it "handles zero" do
      xml_builder = Nokogiri::XML::Builder.new
      instance = test_decimal_class.new(0.0)
      instance.build_xml(xml_builder)

      xml = xml_builder.to_xml
      expect(xml).to include(">0.0</Test_Decimal>")
    end

    it "handles negative values" do
      negative_class = Class.new(described_class) do
        attribute_id "888"
        xml_tag "Negative_Decimal"
        min(-1000.0)
        max 0.0
      end

      xml_builder = Nokogiri::XML::Builder.new
      instance = negative_class.new(-42.5)
      instance.build_xml(xml_builder)

      xml = xml_builder.to_xml
      expect(xml).to include(">-42.5</Negative_Decimal>")
    end
  end

  describe "real-world decimal attribute" do
    it "validates DewPoint correctly" do
      instance = Eccairs::Attributes::DewPoint.new(15.5)
      expect(instance.value).to eq(15.5)
    end

    it "generates valid XML in occurrence" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_dew_point(15.5)
      end

      xml = set.to_xml
      expect(xml).to include("Dew_Point")
      expect(xml).to include(">15.5</Dew_Point>")
    end

    it "validates successfully" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_dew_point(15.5)
      end

      errors = set.validate
      expect(errors).to be_empty
    end
  end

  describe "edge cases" do
    let(:test_decimal_class) do
      Class.new(described_class) do
        attribute_id "999"
        xml_tag "Test_Decimal"
        min 0.0
        max 10.0
      end
    end

    it "handles very small decimals" do
      instance = test_decimal_class.new(0.0001)
      expect(instance.value).to eq(0.0001)
    end

    it "handles scientific notation strings" do
      instance = test_decimal_class.new("5.0e0")
      expect(instance.value).to eq("5.0e0")
    end

    it "validates scientific notation against range" do
      instance = test_decimal_class.new("1.5e1")
      expect(instance.valid?).to be false
      expect(instance.validation_error.message).to match(/greater than maximum/)
    end
  end
end
