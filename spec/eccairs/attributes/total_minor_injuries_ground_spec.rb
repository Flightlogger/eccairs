# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Attributes::TotalMinorInjuriesGround do
  describe "class configuration" do
    it "has correct attribute_id" do
      expect(described_class.attribute_id).to eq("469")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("Total_Minor_Injuries-Ground")
    end

    it "inherits from IntegerAttribute" do
      expect(described_class.superclass).to eq(Eccairs::Base::IntegerAttribute)
    end
  end

  describe "initialization" do
    it "creates an instance with a value" do
      instance = described_class.new(10)
      expect(instance.value).to eq(10)
    end
  end

  describe "XML generation in occurrence" do
    it "generates valid XML within an occurrence" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_total_minor_injuries_ground(10)
      end

      xml = set.to_xml
      expect(xml).to include("Total_Minor_Injuries-Ground")
      expect(xml).to include('attributeId="469"')
    end

    it "validates successfully in a minimal occurrence" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_total_minor_injuries_ground(10)
      end

      errors = set.validate
      expect(errors).to be_empty, "Expected no validation errors, got: #{errors.map(&:message).join(", ")}"
    end
  end
end
