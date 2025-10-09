# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Attributes::StateAreaOfOcc do
  describe "#initialize" do
    it "initializes with nil value by default" do
      entity = described_class.new
      expect(entity.value).to be_nil
    end

    it "initializes with provided value" do
      entity = described_class.new("test")
      expect(entity.value).to eq("test")
    end
  end

  describe ".attribute_id" do
    it "returns attribute ID of 454" do
      expect(described_class.attribute_id).to eq("454")
    end
  end

  describe "#build_xml" do
    it "generates valid XML with value" do
      entity = described_class.new("test")
      builder = Nokogiri::XML::Builder.new
      entity.build_xml(builder)
      xml = builder.to_xml

      expect(xml).to include("State_Area_Of_Occ")
      expect(xml).to include('attributeId="454"')
    end

    it "does not generate XML when value is nil" do
      entity = described_class.new
      builder = Nokogiri::XML::Builder.new
      entity.build_xml(builder)
      xml = builder.to_xml

      expect(xml).not_to include("State_Area_Of_Occ")
    end
  end

  describe "ECCAIRS report validation" do
    it "generates a valid ECCAIRS report with valid country code" do
      report = Eccairs.report
      entity = described_class.new("905") # Valid country code from ECCAIRS enumeration
      report.add_entity(entity)

      expect(report.valid?).to be true
    end
  end
end
