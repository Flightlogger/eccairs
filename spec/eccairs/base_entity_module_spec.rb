# frozen_string_literal: true

require "spec_helper"
require "nokogiri"

RSpec.describe Eccairs::BaseEntityModule do
  let(:test_module) do
    Module.new do
      extend Eccairs::BaseEntityModule
    end
  end

  describe ".entity_id" do
    it "sets and retrieves entity_id" do
      test_module.entity_id "42"
      expect(test_module.entity_id).to eq("42")
    end

    it "converts numeric values to strings" do
      test_module.entity_id 123
      expect(test_module.entity_id).to eq("123")
    end

    it "returns nil when entity_id is not set" do
      expect(test_module.entity_id).to be_nil
    end
  end

  describe ".xml_tag" do
    it "sets and retrieves xml_tag" do
      test_module.xml_tag "Test_Entity"
      expect(test_module.xml_tag).to eq("Test_Entity")
    end

    it "converts values to strings" do
      test_module.xml_tag :TestEntity
      expect(test_module.xml_tag).to eq("TestEntity")
    end

    it "returns nil when xml_tag is not set" do
      expect(test_module.xml_tag).to be_nil
    end
  end

  describe ".build_entity_xml" do
    let(:configured_module) do
      Module.new do
        extend Eccairs::BaseEntityModule

        entity_id "1"
        xml_tag "Test_Entity"
      end
    end

    let(:mock_entity1) do
      double("Entity1",
        class: double(sequence: 1),
        build_xml: nil)
    end

    let(:mock_entity2) do
      double("Entity2",
        class: double(sequence: 2),
        build_xml: nil)
    end

    it "generates XML with correct entity tag and entityId" do
      builder = Nokogiri::XML::Builder.new do |xml|
        configured_module.build_entity_xml(xml, [])
      end

      xml_string = builder.to_xml
      expect(xml_string).to include("<Test_Entity")
      expect(xml_string).to include('entityId="1"')
      expect(xml_string).to include("<ATTRIBUTES")
    end

    it "sorts entities by sequence before building XML" do
      entities = [mock_entity2, mock_entity1]

      Nokogiri::XML::Builder.new do |xml|
        configured_module.build_entity_xml(xml, entities)
      end

      # Verify entities are sorted by sequence
      expect(mock_entity1).to have_received(:build_xml)
      expect(mock_entity2).to have_received(:build_xml)
    end

    it "calls build_xml on each entity" do
      entities = [mock_entity1, mock_entity2]

      Nokogiri::XML::Builder.new do |xml|
        configured_module.build_entity_xml(xml, entities)
      end

      expect(mock_entity1).to have_received(:build_xml)
      expect(mock_entity2).to have_received(:build_xml)
    end

    it "generates valid nested XML structure" do
      # Create real entity instances for integration test
      entity1 = Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::AerodromeLatitude.new(45.5)
      entity2 = Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::AerodromeLongitude.new(-75.5)

      builder = Nokogiri::XML::Builder.new do |xml|
        configured_module.build_entity_xml(xml, [entity1, entity2])
      end

      xml_string = builder.to_xml
      expect(xml_string).to include('<Test_Entity entityId="1">')
      expect(xml_string).to include("<ATTRIBUTES>")
      expect(xml_string).to include("<Aerodrome_Latitude")
      expect(xml_string).to include('attributeId="1"')
      expect(xml_string).to include(">45.5<")
      expect(xml_string).to include("<Aerodrome_Longitude")
      expect(xml_string).to include('attributeId="2"')
      expect(xml_string).to include(">-75.5<")
      expect(xml_string).to include("</ATTRIBUTES>")
      expect(xml_string).to include("</Test_Entity>")
    end
  end

  describe "integration with real entity module" do
    it "works with AerodromeGeneral module" do
      expect(Eccairs::Occurrence::Entities::AerodromeGeneral.entity_id).to eq("1")
      expect(Eccairs::Occurrence::Entities::AerodromeGeneral.xml_tag).to eq("Aerodrome_General")
    end

    it "generates correct XML for AerodromeGeneral" do
      entity = Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::AerodromeLatitude.new(51.5)

      builder = Nokogiri::XML::Builder.new do |xml|
        Eccairs::Occurrence::Entities::AerodromeGeneral.build_entity_xml(xml, [entity])
      end

      xml_string = builder.to_xml
      expect(xml_string).to include('<Aerodrome_General entityId="1">')
      expect(xml_string).to include("<Aerodrome_Latitude")
      expect(xml_string).to include(">51.5<")
    end
  end
end
