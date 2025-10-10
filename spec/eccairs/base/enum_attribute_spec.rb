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
        expect { test_enum_class.new(99) }.to raise_error(ArgumentError, /not in allowed values/)
      end

      it "rejects negative values not in allowed list" do
        expect { test_enum_class.new(-1) }.to raise_error(ArgumentError, /not in allowed values/)
      end

      it "rejects zero if not in allowed list" do
        expect { test_enum_class.new(0) }.to raise_error(ArgumentError, /not in allowed values/)
      end
    end

    describe "with string values" do
      it "converts valid string to integer" do
        instance = test_enum_class.new("2")
        expect(instance.value).to eq(2)
      end

      it "rejects invalid string value" do
        expect { test_enum_class.new("99") }.to raise_error(ArgumentError, /not in allowed values/)
      end

      it "rejects non-numeric strings" do
        expect { test_enum_class.new("invalid") }.to raise_error(ArgumentError, /Cannot resolve value/)
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
        expect { symbolic_enum_class.new(:INVALID) }.to raise_error(ArgumentError, /Cannot resolve value/)
      end
    end

    describe "with nil value" do
      it "accepts nil value" do
        instance = test_enum_class.new(nil)
        expect(instance.value).to be_nil
      end

      it "does not validate nil" do
        expect { test_enum_class.new(nil) }.not_to raise_error
      end
    end

    describe "value assignment" do
      it "validates on value assignment" do
        instance = test_enum_class.new(1)
        expect { instance.value = 99 }.to raise_error(ArgumentError, /not in allowed values/)
      end

      it "allows changing to another valid value" do
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

    it "generates XML with numeric value" do
      xml_builder = Nokogiri::XML::Builder.new
      instance = test_enum_class.new(2)
      instance.build_xml(xml_builder)

      xml = xml_builder.to_xml
      expect(xml).to include("Test_Enum")
      expect(xml).to include(">2</Test_Enum>")
      expect(xml).to include('attributeId="999"')
    end

    it "does not generate XML for nil value" do
      xml_builder = Nokogiri::XML::Builder.new
      instance = test_enum_class.new(nil)
      instance.build_xml(xml_builder)

      xml = xml_builder.to_xml
      expect(xml).not_to include("Test_Enum")
    end
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

      expect { empty_enum_class.new(1) }.to raise_error(ArgumentError, /not in allowed values/)
    end
  end
end
