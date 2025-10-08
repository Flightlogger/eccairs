# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::AerodromeType do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("10")
    end
  end

  describe ".parent_entity_id" do
    it "returns the correct parent_entity_id" do
      expect(described_class.parent_entity_id).to eq("1")
    end
  end

  describe "constants" do
    it "defines AERODROME constant" do
      expect(described_class::AERODROME).to eq(1)
    end

    it "defines HELIPORT constant" do
      expect(described_class::HELIPORT).to eq(2)
    end

    it "defines UNKNOWN constant" do
      expect(described_class::UNKNOWN).to eq(99)
    end
  end

  describe "#build_xml" do
    it "generates XML with correct tag and attributeId" do
      entity = described_class.new(1)
      builder = Nokogiri::XML::Builder.new do |xml|
        entity.build_xml(xml)
      end

      xml_string = builder.to_xml
      expect(xml_string).to include('<Aerodrome_Type')
      expect(xml_string).to include('attributeId="10"')
      expect(xml_string).to include('>1<')
    end
  end

  describe "validation" do
    it "accepts valid aerodrome type values" do
      expect {
        described_class.new(1)
      }.not_to raise_error

      expect {
        described_class.new(2)
      }.not_to raise_error

      expect {
        described_class.new(99)
      }.not_to raise_error
    end

    it "rejects invalid aerodrome type values" do
      expect {
        described_class.new(3)
      }.to raise_error(Eccairs::ValidationError)
    end
  end

  describe "ECCAIRS report validation" do
    it "generates a valid ECCAIRS report with aerodrome_type" do
      report = Eccairs.report
      entity = described_class.new(1)
      report.add_entity(entity)
      
      expect(report.valid?).to be true
    end
  end
end
