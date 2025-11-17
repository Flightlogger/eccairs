# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Attributes::Autopilot do
  describe "class configuration" do
    it "has correct attribute_id" do
      expect(described_class.attribute_id).to eq("804")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("Autopilot")
    end

    it "inherits from EnumAttribute" do
      expect(described_class.superclass).to eq(Eccairs::Base::EnumAttribute)
    end

    it "has correct allowed_values" do
      expected_values = [1, 2, 3]
      expect(described_class.allowed_values).to eq(expected_values)
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

    it "accepts all allowed values" do
      allowed = [1, 2, 3]
      allowed.each do |value|
        instance = described_class.new(value)
        expect(instance.value).to eq(value)
      end
    end

    it "rejects invalid integer value" do
      instance = described_class.new(4)
      expect(instance.valid?).to be false
      expect(instance.validation_error.message).to match(/not in allowed values/)
    end

    it "rejects invalid string value" do
      instance = described_class.new("999")
      expect(instance.valid?).to be false
      expect(instance.validation_error.message).to match(/not in allowed values/)
    end
  end

  describe "XML generation in aircraft" do
    it "generates valid XML within an aircraft" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_autopilot(1)
        end
      end

      xml = set.to_xml
      expect(xml).to include("Autopilot")
      expect(xml).to include('attributeId="804"')
      expect(xml).to include("1")
    end

    it "generates XML with correct structure" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_autopilot(2)
        end
      end

      xml = set.to_xml
      expect(xml).to include("<Autopilot")
      expect(xml).to include('attributeId="804"')
      expect(xml).to include(">2</Autopilot>")
    end

    it "generates XML with value 3" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_autopilot(3)
        end
      end

      xml = set.to_xml
      expect(xml).to include("Autopilot")
      expect(xml).to include('attributeId="804"')
      expect(xml).to include("3")
    end
  end
end
