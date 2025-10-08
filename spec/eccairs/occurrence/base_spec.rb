# frozen_string_literal: true

require "nokogiri"

RSpec.describe Eccairs::Occurrence::Base do
  describe "#initialize" do
    it "initializes with empty entities array" do
      occurrence = described_class.new
      expect(occurrence.entities).to eq([])
    end
  end

  describe "#add_entity" do
    it "adds an entity to the occurrence" do
      occurrence = described_class.new
      entity = Eccairs::Occurrence::Entities::DewPoint.new(15.5)
      occurrence.add_entity(entity)
      expect(occurrence.entities).to include(entity)
    end

    it "returns self for method chaining" do
      occurrence = described_class.new
      entity = Eccairs::Occurrence::Entities::DewPoint.new(15.5)
      result = occurrence.add_entity(entity)
      expect(result).to eq(occurrence)
    end

    it "allows chaining multiple entities" do
      occurrence = described_class.new
      entity1 = Eccairs::Occurrence::Entities::DewPoint.new(15.5)
      entity2 = Eccairs::Occurrence::Entities::WxConditions.new("1")

      occurrence.add_entity(entity1).add_entity(entity2)

      expect(occurrence.entities).to include(entity1, entity2)
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

    it "generates XML with empty ATTRIBUTES when no entities are added" do
      occurrence = described_class.new
      builder = Nokogiri::XML::Builder.new do |xml|
        occurrence.to_xml(xml)
      end

      xml_string = builder.to_xml
      expect(xml_string).to include('<ATTRIBUTES/>')
    end

    it "generates XML with entity attributes when added" do
      occurrence = described_class.new
      entity = Eccairs::Occurrence::Entities::DewPoint.new(15.5)
      occurrence.add_entity(entity)

      builder = Nokogiri::XML::Builder.new do |xml|
        occurrence.to_xml(xml)
      end

      xml_string = builder.to_xml
      expect(xml_string).to include('<Dew_Point Unit="C" attributeId="85">15.5</Dew_Point>')
    end

    it "generates XML with multiple entity attributes" do
      occurrence = described_class.new
      entity1 = Eccairs::Occurrence::Entities::DewPoint.new(15.5)
      entity2 = Eccairs::Occurrence::Entities::WxConditions.new("1")
      occurrence.add_entity(entity1).add_entity(entity2)

      builder = Nokogiri::XML::Builder.new do |xml|
        occurrence.to_xml(xml)
      end

      xml_string = builder.to_xml
      expect(xml_string).to include('<Dew_Point Unit="C" attributeId="85">15.5</Dew_Point>')
      expect(xml_string).to include('<Wx_Conditions attributeId="127">1</Wx_Conditions>')
    end
  end
end
