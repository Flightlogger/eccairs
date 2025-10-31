# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Attributes::BankDirection do
  describe "class configuration" do
    it "has correct attribute_id" do
      expect(described_class.attribute_id).to eq("568")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("Bank_Direction")
    end

    it "inherits from EnumAttribute" do
      expect(described_class.superclass).to eq(Eccairs::Base::EnumAttribute)
    end

    it "has correct allowed values" do
      expect(described_class.allowed_values).to eq([1, 2, 99])
    end

    it "has no allowed values hash (uses array format)" do
      expect(described_class.allowed_values_hash).to be_nil
    end
  end

  describe "initialization" do
    it "creates an instance with a numeric value" do
      instance = described_class.new(1)
      expect(instance.value).to eq(1)
    end

    it "creates an instance with a string value" do
      instance = described_class.new("2")
      expect(instance.value).to eq(2)
    end

    it "creates an instance with value 1" do
      instance = described_class.new(1)
      expect(instance.value).to eq(1)
    end

    it "creates an instance with value 2" do
      instance = described_class.new(2)
      expect(instance.value).to eq(2)
    end

    it "creates an instance with UNKNOWN value" do
      instance = described_class.new(99)
      expect(instance.value).to eq(99)
    end

    it "creates an instance with UNKNOWN numeric value" do
      instance = described_class.new(99)
      expect(instance.value).to eq(99)
    end

    it "raises error for invalid value" do
      expect { described_class.new(3) }.to raise_error(ArgumentError, /not in allowed values/)
    end
  end

  describe "XML generation in occurrence" do
    it "generates valid XML within an occurrence" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_separation do |separation|
          separation.add_separation_aircraft do |separation_aircraft|
            separation_aircraft.add_bank_direction(1)
          end
        end
      end

      xml = set.to_xml
      expect(xml).to include("Bank_Direction")
      expect(xml).to include('attributeId="568"')
    end

    it "generates valid XML structure (schema validation skipped for new attributes)" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_separation do |separation|
          separation.add_separation_aircraft do |separation_aircraft|
            separation_aircraft.add_bank_direction(2)
          end
        end
      end

      xml = set.to_xml
      expect(xml).to include("Bank_Direction")
      expect(xml).to include('attributeId="568"')
      expect(xml).to include("2")
    end

    it "generates valid XML with UNKNOWN value" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_separation do |separation|
          separation.add_separation_aircraft do |separation_aircraft|
            separation_aircraft.add_bank_direction(99)
          end
        end
      end

      xml = set.to_xml
      expect(xml).to include("Bank_Direction")
      expect(xml).to include('attributeId="568"')
      expect(xml).to include("99")
    end
  end
end
