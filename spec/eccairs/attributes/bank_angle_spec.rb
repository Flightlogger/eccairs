# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Attributes::BankAngle do
  describe "class configuration" do
    it "has correct attribute_id" do
      expect(described_class.attribute_id).to eq("567")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("Bank_Angle")
    end

    it "inherits from EnumAttribute" do
      expect(described_class.superclass).to eq(Eccairs::Base::EnumAttribute)
    end

    it "has correct allowed values" do
      expected_values = [1, 2, 3, 4, 5, 99]
      expect(described_class.allowed_values).to eq(expected_values)
    end

    it "has no allowed values hash (uses array format)" do
      expect(described_class.allowed_values_hash).to be_nil
    end
  end

  describe "initialization" do
    it "creates an instance with a numeric value" do
      instance = described_class.new(2)
      expect(instance.value).to eq(2)
    end

    it "creates an instance with a string value" do
      instance = described_class.new("3")
      expect(instance.value).to eq(3)
    end

    it "creates an instance with value 1" do
      instance = described_class.new(1)
      expect(instance.value).to eq(1)
    end

    it "creates an instance with value 4" do
      instance = described_class.new(4)
      expect(instance.value).to eq(4)
    end

    it "creates an instance with value 5" do
      instance = described_class.new(5)
      expect(instance.value).to eq(5)
    end

    it "creates an instance with UNKNOWN value" do
      instance = described_class.new(99)
      expect(instance.value).to eq(99)
    end

    it "raises error for invalid value" do
      expect { described_class.new(6) }.to raise_error(ArgumentError, /not in allowed values/)
    end
  end

  describe "XML generation in occurrence" do
    it "generates valid XML within an occurrence" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_bank_angle(3)
        end
      end

      xml = set.to_xml
      expect(xml).to include("Bank_Angle")
      expect(xml).to include('attributeId="567"')
    end

    it "generates valid XML structure (schema validation skipped for new attributes)" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_bank_angle(2)
        end
      end

      xml = set.to_xml
      expect(xml).to include("Bank_Angle")
      expect(xml).to include('attributeId="567"')
      expect(xml).to include("2")
    end

    it "generates valid XML with value 1" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_bank_angle(1)
        end
      end

      xml = set.to_xml
      expect(xml).to include("Bank_Angle")
      expect(xml).to include('attributeId="567"')
      expect(xml).to include("1")
    end

    it "generates valid XML with value 4" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_bank_angle(4)
        end
      end

      xml = set.to_xml
      expect(xml).to include("Bank_Angle")
      expect(xml).to include('attributeId="567"')
      expect(xml).to include("4")
    end

    it "generates valid XML with value 5" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_bank_angle(5)
        end
      end

      xml = set.to_xml
      expect(xml).to include("Bank_Angle")
      expect(xml).to include('attributeId="567"')
      expect(xml).to include("5")
    end

    it "generates valid XML with UNKNOWN value" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_bank_angle(99)
        end
      end

      xml = set.to_xml
      expect(xml).to include("Bank_Angle")
      expect(xml).to include('attributeId="567"')
      expect(xml).to include("99")
    end
  end
end
