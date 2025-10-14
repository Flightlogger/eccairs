# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Base::Entity do
  # Create test entity and attribute classes for testing
  let(:test_attribute_class) do
    Class.new(Eccairs::Base::Attribute) do
      attribute_id "999"
      xml_tag "Test_Attribute"
      sequence 100
    end
  end

  let(:test_entity_class) do
    Class.new(described_class) do
      entity_id "99"
      xml_tag "Test_Entity"
    end
  end

  let(:test_entity_with_id_class) do
    Class.new(described_class) do
      entity_id "98"
      xml_tag "Test_Entity_With_ID"
      requires_id
    end
  end

  describe "class configuration DSL" do
    describe ".entity_id" do
      it "sets and retrieves entity_id" do
        expect(test_entity_class.entity_id).to eq("99")
      end

      it "converts value to string" do
        klass = Class.new(described_class)
        klass.entity_id 123
        expect(klass.entity_id).to eq("123")
      end
    end

    describe ".xml_tag" do
      it "sets and retrieves xml_tag" do
        expect(test_entity_class.xml_tag).to eq("Test_Entity")
      end

      it "converts value to string" do
        klass = Class.new(described_class)
        klass.xml_tag :test_tag
        expect(klass.xml_tag).to eq("test_tag")
      end
    end

    describe ".requires_id" do
      it "sets requires_id to true" do
        klass = Class.new(described_class)
        klass.requires_id
        expect(klass.requires_id?).to be true
      end

      it "sets requires_id to false" do
        klass = Class.new(described_class)
        klass.requires_id false
        expect(klass.requires_id?).to be false
      end

      it "defaults to false" do
        klass = Class.new(described_class)
        expect(klass.requires_id?).to be false
      end
    end
  end

  describe "initialization" do
    it "initializes with empty attributes hash" do
      instance = test_entity_class.new
      expect(instance.attributes).to eq({})
    end

    it "initializes with empty children hash" do
      instance = test_entity_class.new
      expect(instance.children).to eq({})
    end

    it "initializes with nil parent" do
      instance = test_entity_class.new
      expect(instance.parent).to be_nil
    end

    it "initializes with nil id" do
      instance = test_entity_class.new
      expect(instance.id).to be_nil
    end
  end

  describe "#parent=" do
    it "sets the parent entity" do
      parent = test_entity_class.new
      child = test_entity_class.new
      child.parent = parent
      expect(child.parent).to eq(parent)
    end
  end

  describe "#id=" do
    it "sets the id" do
      instance = test_entity_class.new
      instance.id = "TEST_ID"
      expect(instance.id).to eq("TEST_ID")
    end
  end

  describe "#build_xml" do
    let(:xml_builder) { Nokogiri::XML::Builder.new }

    it "builds XML with entity_id attribute" do
      instance = test_entity_class.new
      instance.build_xml(xml_builder)

      xml = xml_builder.to_xml
      expect(xml).to include("Test_Entity")
      expect(xml).to include('entityId="99"')
    end

    it "generates ID attribute when requires_id is true" do
      instance = test_entity_with_id_class.new
      instance.build_xml(xml_builder)

      xml = xml_builder.to_xml
      expect(xml).to include('ID="Test_Entity_With_ID_1"')
    end

    it "increments ID counter for multiple entities" do
      builder = Nokogiri::XML::Builder.new do |xml|
        xml.root do
          counters = {}

          instance1 = test_entity_with_id_class.new
          instance1.build_xml(xml, counters)

          instance2 = test_entity_with_id_class.new
          instance2.build_xml(xml, counters)
        end
      end

      xml = builder.to_xml
      expect(xml).to include('ID="Test_Entity_With_ID_1"')
      expect(xml).to include('ID="Test_Entity_With_ID_2"')
    end

    it "does not include ATTRIBUTES section when no attributes" do
      instance = test_entity_class.new
      instance.build_xml(xml_builder)

      xml = xml_builder.to_xml
      expect(xml).not_to include("ATTRIBUTES")
    end

    it "does not include ENTITIES section when no children" do
      instance = test_entity_class.new
      instance.build_xml(xml_builder)

      xml = xml_builder.to_xml
      expect(xml).not_to include("ENTITIES")
    end
  end

  describe "#all_attributes" do
    it "returns empty array when no attributes" do
      instance = test_entity_class.new
      expect(instance.all_attributes).to eq([])
    end

    it "returns all attributes from the entity" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_dew_point(25.5)
        occurrence.add_visibility(5000)
      end

      occurrence = set.instance_variable_get(:@occurrences).first
      attrs = occurrence.all_attributes
      expect(attrs.length).to eq(2)
      expect(attrs.map(&:class).map(&:xml_tag)).to contain_exactly("Dew_Point", "Visibility")
    end

    it "returns attributes from nested entities" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_dew_point(25.5)
        occurrence.add_aircraft(id: "AC1") do |aircraft|
          aircraft.add_aircraft_registration("N12345")
        end
      end

      occurrence = set.instance_variable_get(:@occurrences).first
      attrs = occurrence.all_attributes
      expect(attrs.length).to eq(2)
      expect(attrs.map(&:class).map(&:xml_tag)).to contain_exactly("Dew_Point", "Aircraft_Registration")
    end

    it "handles deeply nested entities" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft(id: "AC1") do |aircraft|
          aircraft.add_engine do |engine|
            engine.add_engine_position(1)
          end
        end
      end

      occurrence = set.instance_variable_get(:@occurrences).first
      attrs = occurrence.all_attributes
      expect(attrs.length).to eq(1)
      expect(attrs.first.class.xml_tag).to eq("Engine_Position")
    end
  end

  describe "XML generation in full occurrence" do
    it "generates valid XML structure" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_dew_point(25.5)
      end

      xml = set.to_xml
      expect(xml).to include("<Occurrence")
      expect(xml).to include('entityId="24"')
      expect(xml).to include("<ATTRIBUTES>")
      expect(xml).to include("<Dew_Point")
      expect(xml).to include("</ATTRIBUTES>")
      expect(xml).to include("</Occurrence>")
    end

    it "generates nested entities correctly" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft(id: "AC1") do |aircraft|
          aircraft.add_aircraft_registration("N12345")
        end
      end

      xml = set.to_xml
      expect(xml).to include("<Occurrence")
      expect(xml).to include("<ENTITIES>")
      expect(xml).to include("<Aircraft")
      expect(xml).to include('entityId="4"')
      expect(xml).to include("<ATTRIBUTES>")
      expect(xml).to include("<Aircraft_Registration")
      expect(xml).to include("</Aircraft>")
      expect(xml).to include("</ENTITIES>")
      expect(xml).to include("</Occurrence>")
    end

    it "sorts attributes by sequence" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        # Add in reverse order - should be sorted by sequence in XML
        occurrence.add_visibility(5000) # sequence 310
        occurrence.add_dew_point(25.5) # sequence 85
      end

      xml = set.to_xml
      dew_point_pos = xml.index("Dew_Point")
      visibility_pos = xml.index("Visibility")

      expect(dew_point_pos).to be < visibility_pos
    end
  end
end
