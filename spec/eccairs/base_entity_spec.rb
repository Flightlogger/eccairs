# frozen_string_literal: true

require "nokogiri"

RSpec.describe Eccairs::BaseEntity do
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

    it "validates using validates_numericality declaration" do
      test_class = Class.new(described_class) do
        validates_numericality min: 0, max: 100
      end

      expect {
        test_class.new(50)
      }.not_to raise_error

      expect {
        test_class.new(150)
      }.to raise_error(Eccairs::ValidationError, /less than or equal to 100/)
    end

    it "validates using validates_inclusion declaration" do
      test_class = Class.new(described_class) do
        validates_inclusion within: ["1", "2", "3"]
      end

      expect {
        test_class.new("2")
      }.not_to raise_error

      expect {
        test_class.new("5")
      }.to raise_error(Eccairs::ValidationError, /must be one of: 1, 2, 3/)
    end

    it "converts enum symbols to values" do
      test_class = Class.new(described_class) do
        validates_inclusion within: {SMALL: 1, MEDIUM: 2, LARGE: 3}
      end

      entity = test_class.new(:SMALL)
      expect(entity.value).to eq(1)

      entity = test_class.new(:MEDIUM)
      expect(entity.value).to eq(2)
    end

    it "converts enum strings to values" do
      test_class = Class.new(described_class) do
        validates_inclusion within: {SMALL: 1, MEDIUM: 2, LARGE: 3}
      end

      entity = test_class.new("SMALL")
      expect(entity.value).to eq(1)
    end

    it "accepts direct integer values for enums" do
      test_class = Class.new(described_class) do
        validates_inclusion within: {SMALL: 1, MEDIUM: 2, LARGE: 3}
      end

      entity = test_class.new(2)
      expect(entity.value).to eq(2)
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

  describe ".validates_numericality" do
    it "sets validation type to :numeric" do
      test_class = Class.new(described_class) do
        validates_numericality min: 0, max: 100
      end

      expect(test_class.validation_type).to eq(:numeric)
    end

    it "stores validation options" do
      test_class = Class.new(described_class) do
        validates_numericality min: -50, max: 50, type: :integer
      end

      expect(test_class.validation_options).to eq({min: -50, max: 50, type: :integer})
    end
  end

  describe ".validates_inclusion" do
    it "sets validation type to :enum" do
      test_class = Class.new(described_class) do
        validates_inclusion within: ["1", "2", "3"]
      end

      expect(test_class.validation_type).to eq(:enum)
    end

    it "stores validation options with array" do
      test_class = Class.new(described_class) do
        validates_inclusion within: ["a", "b", "c"]
      end

      expect(test_class.validation_options).to eq({allowed_values: ["a", "b", "c"]})
    end

    it "stores validation options with hash" do
      test_class = Class.new(described_class) do
        validates_inclusion within: {FOO: 1, BAR: 2}
      end

      expect(test_class.validation_options).to eq({allowed_values: [1, 2]})
    end

    it "defines constants from hash keys" do
      test_class = Class.new(described_class) do
        validates_inclusion within: {ALPHA: 10, BETA: 20, GAMMA: 30}
      end

      expect(test_class::ALPHA).to eq(10)
      expect(test_class::BETA).to eq(20)
      expect(test_class::GAMMA).to eq(30)
    end

    it "stores enum mapping" do
      test_class = Class.new(described_class) do
        validates_inclusion within: {RED: 1, GREEN: 2, BLUE: 3}
      end

      expect(test_class.enum_mapping).to eq({RED: 1, GREEN: 2, BLUE: 3})
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

    it "includes additional_xml_attributes when defined" do
      test_class = Class.new(described_class) do
        attribute_id 123
        xml_tag :Test_Tag

        def additional_xml_attributes
          {Unit: "C", Type: "decimal"}
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

    it "wraps text in specified element when wrap_text_in is used" do
      test_class = Class.new(described_class) do
        attribute_id 425
        xml_tag :Narrative_Text
        wrap_text_in "PlainText"
      end

      entity = test_class.new("This is a test narrative")
      builder = Nokogiri::XML::Builder.new(encoding: "UTF-8") do |xml|
        xml.root("xmlns:dt" => "http://eccairsportal.jrc.ec.europa.eu/ECCAIRS5_dataTypes.xsd") do
          entity.build_xml(xml)
        end
      end

      xml_string = builder.to_xml
      expect(xml_string).to include("Narrative_Text")
      expect(xml_string).to include('attributeId="425"')
      expect(xml_string).to include("<dt:PlainText>This is a test narrative</dt:PlainText>")
    end
  end
end
