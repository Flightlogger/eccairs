# frozen_string_literal: true

require "spec_helper"
require "nokogiri"

RSpec.describe Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::AerodromeLatitude do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("1")
    end
  end

  describe "#build_xml" do
    it "generates XML with correct tag and attributeId" do
      entity = described_class.new(45.5)
      builder = Nokogiri::XML::Builder.new do |xml|
        entity.build_xml(xml)
      end

      xml_string = builder.to_xml
      expect(xml_string).to include("<Aerodrome_Latitude")
      expect(xml_string).to include('attributeId="1"')
      expect(xml_string).to include(">45.5<")
    end
  end

  describe "validation" do
    it "accepts valid latitude values" do
      expect {
        described_class.new(0)
      }.not_to raise_error

      expect {
        described_class.new(45.5)
      }.not_to raise_error

      expect {
        described_class.new(-45.5)
      }.not_to raise_error

      expect {
        described_class.new(90.0)
      }.not_to raise_error

      expect {
        described_class.new(-90.0)
      }.not_to raise_error
    end

    it "rejects latitude values outside valid range" do
      expect {
        described_class.new(90.1)
      }.to raise_error(Eccairs::ValidationError)

      expect {
        described_class.new(-90.1)
      }.to raise_error(Eccairs::ValidationError)

      expect {
        described_class.new(180)
      }.to raise_error(Eccairs::ValidationError)
    end

    it "rejects non-numeric values" do
      expect {
        described_class.new("invalid")
      }.to raise_error(Eccairs::ValidationError)
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with aerodrome_latitude" do
      set = Eccairs.set
      entity = described_class.new(45.5)
      set.add_entity(entity)

      expect(set.valid?).to be true
    end
  end
end
