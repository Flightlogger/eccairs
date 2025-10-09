# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::LocationIndicator do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("5")
    end
  end

  describe "#build_xml" do
    it "generates XML with correct tag and attributeId" do
      entity = described_class.new("1000")
      builder = Nokogiri::XML::Builder.new do |xml|
        entity.build_xml(xml)
      end

      xml_string = builder.to_xml
      expect(xml_string).to include("<Location_Indicator")
      expect(xml_string).to include('attributeId="5"')
      expect(xml_string).to include(">1000<")
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with location_indicator" do
      set = Eccairs.set
      entity = described_class.new("1000")
      set.add_entity(entity)

      expect(set.valid?).to be true
    end
  end
end
