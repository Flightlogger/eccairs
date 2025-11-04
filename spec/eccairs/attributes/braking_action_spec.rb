# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Attributes::BrakingAction do
  describe "class configuration" do
    it "has correct attribute_id" do
      expect(described_class.attribute_id).to eq("498")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("Braking_Action")
    end

    it "inherits from EnumAttribute" do
      expect(described_class.superclass).to eq(Eccairs::Base::EnumAttribute)
    end

    it "has correct allowed_values" do
      expected_values = [1, 2, 3, 4, 99]
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
      allowed = [1, 2, 3, 4, 99]
      allowed.each do |value|
        instance = described_class.new(value)
        expect(instance.value).to eq(value)
      end
    end

    it "rejects invalid integer value" do
      expect { described_class.new(5) }.to raise_error(ArgumentError, /not in allowed values/)
    end

    it "rejects invalid string value" do
      expect { described_class.new("999") }.to raise_error(ArgumentError, /not in allowed values/)
    end
  end

  describe "XML generation in aerodrome general" do
    it "generates valid XML within an aerodrome general" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aerodrome_general do |aerodrome_general|
          aerodrome_general.add_braking_action(1)
        end
      end

      xml = set.to_xml
      expect(xml).to include("Braking_Action")
      expect(xml).to include('attributeId="498"')
      expect(xml).to include("1")
    end

    it "generates XML with correct structure" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aerodrome_general do |aerodrome_general|
          aerodrome_general.add_braking_action(2)
        end
      end

      xml = set.to_xml
      expect(xml).to include("<Braking_Action")
      expect(xml).to include('attributeId="498"')
      expect(xml).to include(">2</Braking_Action>")
    end

    it "generates XML with value 3" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aerodrome_general do |aerodrome_general|
          aerodrome_general.add_braking_action(3)
        end
      end

      xml = set.to_xml
      expect(xml).to include("Braking_Action")
      expect(xml).to include('attributeId="498"')
      expect(xml).to include("3")
    end

    it "generates XML with value 4" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aerodrome_general do |aerodrome_general|
          aerodrome_general.add_braking_action(4)
        end
      end

      xml = set.to_xml
      expect(xml).to include("Braking_Action")
      expect(xml).to include('attributeId="498"')
      expect(xml).to include("4")
    end

    it "generates XML with UNKNOWN value" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aerodrome_general do |aerodrome_general|
          aerodrome_general.add_braking_action(99)
        end
      end

      xml = set.to_xml
      expect(xml).to include("Braking_Action")
      expect(xml).to include('attributeId="498"')
      expect(xml).to include("99")
    end
  end
end
