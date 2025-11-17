# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Base::EnumAttribute do
  describe "class configuration" do
    describe ".allowed_values with array" do
      let(:test_enum_class) do
        Class.new(described_class) do
          attribute_id "999"
          xml_tag "Test_Enum"
          allowed_values [1, 2, 3, 4, 5]
        end
      end

      it "sets allowed_values" do
        expect(test_enum_class.allowed_values).to eq([1, 2, 3, 4, 5])
      end

      it "returns nil for allowed_values_hash" do
        expect(test_enum_class.allowed_values_hash).to be_nil
      end
    end

    describe ".allowed_values with hash" do
      let(:test_enum_class) do
        Class.new(described_class) do
          attribute_id "999"
          xml_tag "Test_Enum"
          allowed_values({
            OPTION_ONE: 1,
            OPTION_TWO: 2,
            OPTION_THREE: 3
          })
        end
      end

      it "sets allowed_values to hash values" do
        expect(test_enum_class.allowed_values).to eq([1, 2, 3])
      end

      it "sets allowed_values_hash" do
        expect(test_enum_class.allowed_values_hash).to eq({
          OPTION_ONE: 1,
          OPTION_TWO: 2,
          OPTION_THREE: 3
        })
      end

      it "defines constants for symbolic names" do
        expect(test_enum_class::OPTION_ONE).to eq(1)
        expect(test_enum_class::OPTION_TWO).to eq(2)
        expect(test_enum_class::OPTION_THREE).to eq(3)
      end
    end
  end

  describe "validation" do
    let(:test_enum_class) do
      Class.new(described_class) do
        attribute_id "999"
        xml_tag "Test_Enum"
        allowed_values [1, 2, 3]
      end
    end

    describe "with integer values" do
      it "accepts valid integer value" do
        instance = test_enum_class.new(1)
        expect(instance.value).to eq(1)
      end

      it "accepts all allowed values" do
        [1, 2, 3].each do |value|
          instance = test_enum_class.new(value)
          expect(instance.value).to eq(value)
        end
      end

      it "rejects invalid integer value" do
        instance = test_enum_class.new(99)
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/not in allowed values/)
      end

      it "rejects negative values not in allowed list" do
        instance = test_enum_class.new(-1)
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/not in allowed values/)
      end

      it "rejects zero if not in allowed list" do
        instance = test_enum_class.new(0)
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/not in allowed values/)
      end
    end

    describe "with string values" do
      it "converts valid string to integer" do
        instance = test_enum_class.new("2")
        expect(instance.value).to eq(2)
      end

      it "rejects invalid string value" do
        instance = test_enum_class.new("99")
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/not in allowed values/)
      end

      it "rejects non-numeric strings" do
        instance = test_enum_class.new("invalid")
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/Cannot resolve value/)
      end
    end

    describe "with symbolic values" do
      let(:symbolic_enum_class) do
        Class.new(described_class) do
          attribute_id "888"
          xml_tag "Symbolic_Enum"
          allowed_values({
            LOW: 1,
            MEDIUM: 2,
            HIGH: 3
          })
        end
      end

      it "accepts symbolic constant" do
        instance = symbolic_enum_class.new(symbolic_enum_class::LOW)
        expect(instance.value).to eq(1)
      end

      it "accepts symbol key" do
        instance = symbolic_enum_class.new(:LOW)
        expect(instance.value).to eq(1)
      end

      it "accepts lowercase symbol" do
        instance = symbolic_enum_class.new(:low)
        expect(instance.value).to eq(1)
      end

      it "accepts string key" do
        instance = symbolic_enum_class.new("LOW")
        expect(instance.value).to eq(1)
      end

      it "accepts lowercase string" do
        instance = symbolic_enum_class.new("low")
        expect(instance.value).to eq(1)
      end

      it "rejects invalid symbol" do
        instance = symbolic_enum_class.new(:INVALID)
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/Cannot resolve value/)
      end
    end

    describe "with nil value" do
      let(:test_class) { test_enum_class }

      include_examples "an attribute with nil value handling"
    end

    describe "value assignment" do
      let(:test_class) { test_enum_class }

      include_examples "an attribute with value assignment",
        1,
        99,
        /not in allowed values/

      it "allows changing to another valid value", alternate_valid_value: 2 do
        instance = test_enum_class.new(1)
        instance.value = 2
        expect(instance.value).to eq(2)
      end
    end
  end

  describe "XML generation" do
    let(:test_enum_class) do
      Class.new(described_class) do
        attribute_id "999"
        xml_tag "Test_Enum"
        allowed_values [1, 2, 3]
      end
    end

    let(:test_class) { test_enum_class }

    include_examples "an attribute with XML generation",
      2,
      "Test_Enum",
      "999"
  end

  describe "real-world enum attribute" do
    it "validates AerodromeStatus correctly" do
      # AerodromeStatus has specific allowed values
      instance = Eccairs::Attributes::AerodromeStatus.new(1)
      expect(instance.value).to eq(1)
    end

    it "generates valid XML in occurrence" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aerodrome_general do |aerodrome|
          aerodrome.add_aerodrome_status(1)
        end
      end

      xml = set.to_xml
      expect(xml).to include("Aerodrome_Status")
      expect(xml).to include(">1</Aerodrome_Status>")
    end

    it "validates successfully" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aerodrome_general do |aerodrome|
          aerodrome.add_aerodrome_status(1)
        end
      end

      errors = set.validate
      expect(errors).to be_empty
    end
  end

  describe "edge cases" do
    let(:test_enum_class) do
      Class.new(described_class) do
        attribute_id "999"
        xml_tag "Test_Enum"
        allowed_values [0, 1, 100, 999]
      end
    end

    it "accepts zero when in allowed values" do
      instance = test_enum_class.new(0)
      expect(instance.value).to eq(0)
    end

    it "accepts large numbers when in allowed values" do
      instance = test_enum_class.new(999)
      expect(instance.value).to eq(999)
    end

    it "handles empty allowed_values gracefully" do
      empty_enum_class = Class.new(described_class) do
        attribute_id "777"
        xml_tag "Empty_Enum"
        allowed_values []
      end

      instance = empty_enum_class.new(1)
      expect(instance.valid?).to be false
      expect(instance.validation_error.message).to match(/not in allowed values/)
    end
  end
end
