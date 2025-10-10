# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Base::IntegerAttribute do
  describe "class configuration" do
    describe ".min and .max" do
      let(:test_integer_class) do
        Class.new(described_class) do
          attribute_id "999"
          xml_tag "Test_Integer"
          min(-100)
          max 100
        end
      end

      it "sets min value" do
        expect(test_integer_class.min).to eq(-100)
      end

      it "sets max value" do
        expect(test_integer_class.max).to eq(100)
      end

      it "converts min to integer" do
        klass = Class.new(described_class)
        klass.min "50"
        expect(klass.min).to eq(50)
      end

      it "converts max to integer" do
        klass = Class.new(described_class)
        klass.max "200"
        expect(klass.max).to eq(200)
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
    let(:test_integer_class) do
      Class.new(described_class) do
        attribute_id "999"
        xml_tag "Test_Integer"
        min(-100)
        max 100
      end
    end

    describe "type validation" do
      it "accepts integer values" do
        instance = test_integer_class.new(50)
        expect(instance.value).to eq(50)
      end

      it "accepts string that can be converted to integer" do
        instance = test_integer_class.new("50")
        expect(instance.value).to eq("50")
      end

      it "rejects non-numeric strings" do
        expect { test_integer_class.new("abc") }.to raise_error(ArgumentError, /must be an integer/)
      end

      it "rejects float strings" do
        expect { test_integer_class.new("3.14") }.to raise_error(ArgumentError, /must be an integer/)
      end

      it "rejects arrays" do
        expect { test_integer_class.new([1, 2, 3]) }.to raise_error(ArgumentError, /must be an integer/)
      end

      it "rejects hashes" do
        expect { test_integer_class.new({key: "value"}) }.to raise_error(ArgumentError, /must be an integer/)
      end
    end

    describe "range validation" do
      it "accepts value within range" do
        instance = test_integer_class.new(50)
        expect(instance.value).to eq(50)
      end

      it "accepts value at min boundary" do
        instance = test_integer_class.new(-100)
        expect(instance.value).to eq(-100)
      end

      it "accepts value at max boundary" do
        instance = test_integer_class.new(100)
        expect(instance.value).to eq(100)
      end

      it "rejects value below min" do
        expect { test_integer_class.new(-101) }.to raise_error(ArgumentError, /less than minimum of -100/)
      end

      it "rejects value above max" do
        expect { test_integer_class.new(101) }.to raise_error(ArgumentError, /greater than maximum of 100/)
      end

      it "accepts zero when in range" do
        instance = test_integer_class.new(0)
        expect(instance.value).to eq(0)
      end

      it "accepts negative values when in range" do
        instance = test_integer_class.new(-50)
        expect(instance.value).to eq(-50)
      end
    end

    describe "without min constraint" do
      let(:no_min_class) do
        Class.new(described_class) do
          attribute_id "888"
          xml_tag "No_Min_Integer"
          max 100
        end
      end

      it "accepts any value below max" do
        instance = no_min_class.new(-999999)
        expect(instance.value).to eq(-999999)
      end

      it "still enforces max" do
        expect { no_min_class.new(101) }.to raise_error(ArgumentError, /greater than maximum/)
      end
    end

    describe "without max constraint" do
      let(:no_max_class) do
        Class.new(described_class) do
          attribute_id "777"
          xml_tag "No_Max_Integer"
          min(-100)
        end
      end

      it "accepts any value above min" do
        instance = no_max_class.new(999999)
        expect(instance.value).to eq(999999)
      end

      it "still enforces min" do
        expect { no_max_class.new(-101) }.to raise_error(ArgumentError, /less than minimum/)
      end
    end

    describe "without any constraints" do
      let(:unlimited_class) do
        Class.new(described_class) do
          attribute_id "666"
          xml_tag "Unlimited_Integer"
        end
      end

      it "accepts any integer value" do
        instance = unlimited_class.new(999999)
        expect(instance.value).to eq(999999)
      end

      it "accepts large negative values" do
        instance = unlimited_class.new(-999999)
        expect(instance.value).to eq(-999999)
      end

      it "still validates type" do
        expect { unlimited_class.new("abc") }.to raise_error(ArgumentError, /must be an integer/)
      end
    end

    describe "with nil value" do
      it "accepts nil value" do
        instance = test_integer_class.new(nil)
        expect(instance.value).to be_nil
      end

      it "does not validate nil" do
        expect { test_integer_class.new(nil) }.not_to raise_error
      end
    end

    describe "value assignment" do
      it "validates on value assignment" do
        instance = test_integer_class.new(50)
        expect { instance.value = 101 }.to raise_error(ArgumentError, /greater than maximum/)
      end

      it "allows changing to another valid value" do
        instance = test_integer_class.new(50)
        instance.value = 75
        expect(instance.value).to eq(75)
      end
    end
  end

  describe "XML generation" do
    let(:test_integer_class) do
      Class.new(described_class) do
        attribute_id "999"
        xml_tag "Test_Integer"
        min 0
        max 1000
      end
    end

    it "generates XML with integer value" do
      xml_builder = Nokogiri::XML::Builder.new
      instance = test_integer_class.new(42)
      instance.build_xml(xml_builder)

      xml = xml_builder.to_xml
      expect(xml).to include("Test_Integer")
      expect(xml).to include(">42</Test_Integer>")
      expect(xml).to include('attributeId="999"')
    end

    it "handles zero" do
      xml_builder = Nokogiri::XML::Builder.new
      instance = test_integer_class.new(0)
      instance.build_xml(xml_builder)

      xml = xml_builder.to_xml
      expect(xml).to include(">0</Test_Integer>")
    end

    it "handles negative values" do
      negative_class = Class.new(described_class) do
        attribute_id "888"
        xml_tag "Negative_Integer"
        min(-1000)
        max 0
      end

      xml_builder = Nokogiri::XML::Builder.new
      instance = negative_class.new(-42)
      instance.build_xml(xml_builder)

      xml = xml_builder.to_xml
      expect(xml).to include(">-42</Negative_Integer>")
    end

    it "does not generate XML for nil value" do
      xml_builder = Nokogiri::XML::Builder.new
      instance = test_integer_class.new(nil)
      instance.build_xml(xml_builder)

      xml = xml_builder.to_xml
      expect(xml).not_to include("Test_Integer")
    end
  end

  describe "real-world integer attribute" do
    it "validates Visibility correctly" do
      instance = Eccairs::Attributes::Visibility.new(5000)
      expect(instance.value).to eq(5000)
    end

    it "generates valid XML in occurrence" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_visibility(5000)
      end

      xml = set.to_xml
      expect(xml).to include("Visibility")
      expect(xml).to include(">5000</Visibility>")
    end

    it "validates successfully" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_visibility(5000)
      end

      errors = set.validate
      expect(errors).to be_empty
    end
  end

  describe "edge cases" do
    let(:test_integer_class) do
      Class.new(described_class) do
        attribute_id "999"
        xml_tag "Test_Integer"
        min 0
        max 10
      end
    end

    it "handles string integers" do
      instance = test_integer_class.new("5")
      expect(instance.value).to eq("5")
    end

    it "validates string integers against range" do
      expect { test_integer_class.new("11") }.to raise_error(ArgumentError, /greater than maximum/)
    end

    it "rejects floats that would be in range if truncated" do
      expect { test_integer_class.new(5.5) }.to raise_error(ArgumentError, /must be an integer/)
    end
  end
end
