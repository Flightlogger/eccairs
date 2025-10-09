# frozen_string_literal: true

require "nokogiri"

RSpec.describe Eccairs::Base::Entity do
  describe "inheritance check" do
    it "ensures no occurrence entities inherit directly from Entity" do
      # Find all entity classes in the occurrence namespace
      entity_classes = []

      # Recursively find all classes that inherit from Entity
      def find_entity_classes(mod, list)
        mod.constants.each do |const_name|
          const = mod.const_get(const_name)
          if const.is_a?(Class)
            if const < Eccairs::Base::Entity && const != Eccairs::Base::Entity
              list << const
            end
          elsif const.is_a?(Module)
            find_entity_classes(const, list)
          end
        end
      end

      find_entity_classes(Eccairs::Occurrence, entity_classes)

      # Check that all occurrence entities inherit from a typed entity, not directly from Entity
      typed_entities = [
        Eccairs::Base::DecimalEntity,
        Eccairs::Base::IntegerEntity,
        Eccairs::Base::EnumEntity,
        Eccairs::Base::StringEntity,
        Eccairs::Base::DateEntity,
        Eccairs::Base::TimeEntity
      ]

      entity_classes.each do |entity_class|
        expect(typed_entities).to include(entity_class.superclass),
          "#{entity_class} should inherit from a typed entity (DecimalEntity, IntegerEntity, etc.), " \
          "not directly from Entity. Found: #{entity_class.superclass}"
      end

      # Ensure we found some entities (sanity check)
      expect(entity_classes.length).to be > 0
    end
  end

  describe "#initialize" do
    it "initializes with nil value by default" do
      entity = described_class.new
      expect(entity.value).to be_nil
    end

    it "initializes with provided value" do
      entity = described_class.new(42)
      expect(entity.value).to eq(42)
    end
  end

  describe "#value=" do
    it "sets the value" do
      entity = described_class.new
      entity.value = 100
      expect(entity.value).to eq(100)
    end

    it "calls validate_value hook" do
      entity = described_class.new
      expect(entity).to receive(:validate_value).with(50)
      entity.value = 50
    end
  end

  describe ".attribute_id" do
    it "can set and retrieve attribute_id" do
      test_class = Class.new(described_class) do
        attribute_id 123
      end

      expect(test_class.attribute_id).to eq("123")
    end

    it "returns nil when attribute_id is not set" do
      test_class = Class.new(described_class)
      expect(test_class.attribute_id).to be_nil
    end
  end

  describe ".xml_tag" do
    it "can set and retrieve xml_tag" do
      test_class = Class.new(described_class) do
        xml_tag :Test_Tag
      end

      expect(test_class.xml_tag).to eq("Test_Tag")
    end

    it "returns nil when xml_tag is not set" do
      test_class = Class.new(described_class)
      expect(test_class.xml_tag).to be_nil
    end
  end

  describe "#build_xml" do
    it "raises NotImplementedError when xml_tag is not defined" do
      entity = described_class.new(42)
      builder = Nokogiri::XML::Builder.new

      expect {
        entity.build_xml(builder)
      }.to raise_error(NotImplementedError, /must define xml_tag/)
    end

    it "does not generate XML when value is nil" do
      test_class = Class.new(described_class) do
        attribute_id 123
        xml_tag :Test_Tag
      end

      entity = test_class.new
      builder = Nokogiri::XML::Builder.new do |xml|
        entity.build_xml(xml)
      end

      xml_string = builder.to_xml
      expect(xml_string).not_to include("Test_Tag")
    end

    it "generates XML with tag and attributeId when value is present" do
      test_class = Class.new(described_class) do
        attribute_id 123
        xml_tag :Test_Tag
      end

      entity = test_class.new("test_value")
      builder = Nokogiri::XML::Builder.new do |xml|
        entity.build_xml(xml)
      end

      xml_string = builder.to_xml
      expect(xml_string).to include('<Test_Tag attributeId="123">test_value</Test_Tag>')
    end

  end
end
