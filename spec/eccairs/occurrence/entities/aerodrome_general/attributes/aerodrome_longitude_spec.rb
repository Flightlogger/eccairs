# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::AerodromeLongitude do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("2")
    end
  end


  describe "#build_xml" do
    it "generates XML with correct tag and attributeId" do
      entity = described_class.new(-75.5)
      builder = Nokogiri::XML::Builder.new do |xml|
        entity.build_xml(xml)
      end

      xml_string = builder.to_xml
      expect(xml_string).to include('<Aerodrome_Longitude')
      expect(xml_string).to include('attributeId="2"')
      expect(xml_string).to include('>-75.5<')
    end
  end

  describe "validation" do
    it "accepts valid longitude values" do
      expect {
        described_class.new(0)
      }.not_to raise_error

      expect {
        described_class.new(75.5)
      }.not_to raise_error

      expect {
        described_class.new(-75.5)
      }.not_to raise_error

      expect {
        described_class.new(180.0)
      }.not_to raise_error

      expect {
        described_class.new(-180.0)
      }.not_to raise_error
    end

    it "rejects longitude values outside valid range" do
      expect {
        described_class.new(180.1)
      }.to raise_error(Eccairs::ValidationError)

      expect {
        described_class.new(-180.1)
      }.to raise_error(Eccairs::ValidationError)
    end

    it "rejects non-numeric values" do
      expect {
        described_class.new("invalid")
      }.to raise_error(Eccairs::ValidationError)
    end
  end

  describe "ECCAIRS report validation" do
    it "generates a valid ECCAIRS report with aerodrome_longitude" do
      report = Eccairs.report
      entity = described_class.new(-75.5)
      report.add_entity(entity)

      expect(report.valid?).to be true
    end
  end
end
