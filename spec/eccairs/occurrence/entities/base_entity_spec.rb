# frozen_string_literal: true

require "nokogiri"

RSpec.describe Eccairs::Occurrence::Entities::BaseEntity do
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

  describe "#validate_numeric!" do
    let(:entity) { described_class.new }

    it "accepts valid numeric values" do
      expect {
        entity.send(:validate_numeric!, :test, 50, min: 0, max: 100)
      }.not_to raise_error
    end

    it "accepts nil values" do
      expect {
        entity.send(:validate_numeric!, :test, nil, min: 0, max: 100)
      }.not_to raise_error
    end

    it "raises error for non-numeric values" do
      expect {
        entity.send(:validate_numeric!, :test, "not a number", min: 0, max: 100)
      }.to raise_error(Eccairs::ValidationError, /must be a number/)
    end

    it "raises error for values below minimum" do
      expect {
        entity.send(:validate_numeric!, :test, -10, min: 0, max: 100)
      }.to raise_error(Eccairs::ValidationError, /greater than or equal to 0/)
    end

    it "raises error for values above maximum" do
      expect {
        entity.send(:validate_numeric!, :test, 150, min: 0, max: 100)
      }.to raise_error(Eccairs::ValidationError, /less than or equal to 100/)
    end
  end

  describe "#validate_enum!" do
    let(:entity) { described_class.new }

    it "accepts valid enum values" do
      expect {
        entity.send(:validate_enum!, :test, "1", allowed_values: ["1", "2", "3"])
      }.not_to raise_error
    end

    it "accepts nil values" do
      expect {
        entity.send(:validate_enum!, :test, nil, allowed_values: ["1", "2", "3"])
      }.not_to raise_error
    end

    it "raises error for invalid enum values" do
      expect {
        entity.send(:validate_enum!, :test, "4", allowed_values: ["1", "2", "3"])
      }.to raise_error(Eccairs::ValidationError, /must be one of: 1, 2, 3/)
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
      expect(xml_string).not_to include('Test_Tag')
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

    it "includes additional_xml_attributes when defined" do
      test_class = Class.new(described_class) do
        attribute_id 123
        xml_tag :Test_Tag

        def additional_xml_attributes
          { Unit: "C", Type: "decimal" }
        end
      end

      entity = test_class.new(42)
      builder = Nokogiri::XML::Builder.new do |xml|
        entity.build_xml(xml)
      end

      xml_string = builder.to_xml
      expect(xml_string).to include('Unit="C"')
      expect(xml_string).to include('Type="decimal"')
      expect(xml_string).to include('attributeId="123"')
    end
  end
end
