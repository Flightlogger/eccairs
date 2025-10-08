# frozen_string_literal: true

require "nokogiri"

RSpec.describe Eccairs::Occurrence::BaseOccurrence do
  describe "#initialize" do
    it "initializes with empty attributes" do
      occurrence = described_class.new
      expect(occurrence.attributes).to eq({})
    end
  end

  describe "#add_attribute" do
    it "adds an attribute to the occurrence" do
      occurrence = described_class.new
      occurrence.add_attribute(:test_key, "test_value")
      expect(occurrence.attributes[:test_key]).to eq("test_value")
    end

    it "returns self for method chaining" do
      occurrence = described_class.new
      result = occurrence.add_attribute(:test_key, "test_value")
      expect(result).to eq(occurrence)
    end

    it "allows chaining multiple attributes" do
      occurrence = described_class.new
      occurrence.add_attribute(:key1, "value1")
                .add_attribute(:key2, "value2")
      expect(occurrence.attributes[:key1]).to eq("value1")
      expect(occurrence.attributes[:key2]).to eq("value2")
    end
  end

  describe ".entity_id" do
    it "returns default entity ID of 24" do
      expect(described_class.entity_id).to eq("24")
    end
  end

  describe "#to_xml" do
    it "generates XML with Occurrence wrapper and entityId" do
      occurrence = described_class.new
      builder = Nokogiri::XML::Builder.new do |xml|
        occurrence.to_xml(xml)
      end

      xml_string = builder.to_xml
      expect(xml_string).to include('<Occurrence entityId="24">')
      expect(xml_string).to match(/<ATTRIBUTES[\/>]/)
    end

    it "generates XML with empty ATTRIBUTES when no attributes are added" do
      occurrence = described_class.new
      builder = Nokogiri::XML::Builder.new do |xml|
        occurrence.to_xml(xml)
      end
      
      xml_string = builder.to_xml
      expect(xml_string).to include('<ATTRIBUTES/>')
    end

    it "generates XML with attributes when added" do
      occurrence = described_class.new
      occurrence.add_attribute(:TestAttribute, "test_value")
      
      builder = Nokogiri::XML::Builder.new do |xml|
        occurrence.to_xml(xml)
      end
      
      xml_string = builder.to_xml
      expect(xml_string).to include('<TestAttribute>test_value</TestAttribute>')
    end
  end
end
