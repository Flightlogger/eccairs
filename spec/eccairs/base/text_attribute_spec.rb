# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Base::TextAttribute do
  describe "class configuration" do
    describe ".max_length" do
      let(:test_text_class) do
        Class.new(described_class) do
          attribute_id "999"
          xml_tag "Test_Text"
          max_length 50
        end
      end

      it "sets max_length" do
        expect(test_text_class.max_length).to eq(50)
      end

      it "converts value to integer" do
        klass = Class.new(described_class)
        klass.max_length "100"
        expect(klass.max_length).to eq(100)
      end

      it "returns nil when not set" do
        klass = Class.new(described_class)
        expect(klass.max_length).to be_nil
      end
    end
  end

  describe "inheritance" do
    it "inherits from Attribute" do
      expect(described_class.superclass).to eq(Eccairs::Base::Attribute)
    end

    it "has access to Attribute DSL methods" do
      test_class = Class.new(described_class) do
        attribute_id "123"
        xml_tag "Test_Text"
        sequence 5
        unit "TestUnit"
      end

      expect(test_class.attribute_id).to eq("123")
      expect(test_class.xml_tag).to eq("Test_Text")
      expect(test_class.sequence).to eq(5)
      expect(test_class.unit).to eq("TestUnit")
    end
  end

  describe "validation" do
    let(:test_text_class) do
      Class.new(described_class) do
        attribute_id "999"
        xml_tag "Test_Text"
        max_length 10
      end
    end

    describe "type validation" do
      it "accepts string values" do
        instance = test_text_class.new("hello")
        expect(instance.value).to eq("hello")
      end

      it "rejects non-string values" do
        expect { test_text_class.new(123) }.to raise_error(ArgumentError, /must be a string/)
      end

      it "rejects integer" do
        expect { test_text_class.new(42) }.to raise_error(ArgumentError, /must be a string/)
      end

      it "rejects float" do
        expect { test_text_class.new(3.14) }.to raise_error(ArgumentError, /must be a string/)
      end

      it "rejects array" do
        expect { test_text_class.new([1, 2, 3]) }.to raise_error(ArgumentError, /must be a string/)
      end

      it "rejects hash" do
        expect { test_text_class.new({key: "value"}) }.to raise_error(ArgumentError, /must be a string/)
      end

      it "rejects symbol" do
        expect { test_text_class.new(:symbol) }.to raise_error(ArgumentError, /must be a string/)
      end
    end

    describe "length validation" do
      it "accepts string within max_length" do
        instance = test_text_class.new("short")
        expect(instance.value).to eq("short")
      end

      it "accepts string exactly at max_length" do
        instance = test_text_class.new("1234567890")
        expect(instance.value).to eq("1234567890")
      end

      it "rejects string exceeding max_length" do
        expect { test_text_class.new("12345678901") }.to raise_error(ArgumentError, /exceeds maximum/)
      end

      it "accepts empty string" do
        instance = test_text_class.new("")
        expect(instance.value).to eq("")
      end

      it "includes actual and max length in error message" do
        expect { test_text_class.new("12345678901") }.to raise_error(ArgumentError, /length 11 exceeds maximum of 10/)
      end
    end

    describe "without max_length constraint" do
      let(:unlimited_text_class) do
        Class.new(described_class) do
          attribute_id "888"
          xml_tag "Unlimited_Text"
        end
      end

      it "accepts any length string" do
        long_string = "a" * 10000
        instance = unlimited_text_class.new(long_string)
        expect(instance.value).to eq(long_string)
      end

      it "still validates type" do
        expect { unlimited_text_class.new(123) }.to raise_error(ArgumentError, /must be a string/)
      end
    end

    describe "with nil value" do
      it "accepts nil value" do
        instance = test_text_class.new(nil)
        expect(instance.value).to be_nil
      end

      it "does not validate nil" do
        expect { test_text_class.new(nil) }.not_to raise_error
      end
    end

    describe "value assignment" do
      it "validates on value assignment" do
        instance = test_text_class.new("short")
        expect { instance.value = "12345678901" }.to raise_error(ArgumentError, /exceeds maximum/)
      end

      it "allows changing to another valid value" do
        instance = test_text_class.new("hello")
        instance.value = "world"
        expect(instance.value).to eq("world")
      end
    end
  end

  describe "XML generation" do
    let(:test_text_class) do
      Class.new(described_class) do
        attribute_id "999"
        xml_tag "Test_Text"
        max_length 50
        text_type true
      end
    end

    it "generates XML with PlainText child element" do
      xml_builder = Nokogiri::XML::Builder.new do |xml|
        xml.root('xmlns:dt' => 'http://eccairsportal.jrc.ec.europa.eu/ECCAIRS5_dataTypes.xsd') do
          instance = test_text_class.new("test value")
          instance.build_xml(xml)
        end
      end

      xml = xml_builder.to_xml
      expect(xml).to include("Test_Text")
      expect(xml).to include("<dt:PlainText>test value</dt:PlainText>")
      expect(xml).to include('attributeId="999"')
    end

    it "handles special XML characters in PlainText" do
      xml_builder = Nokogiri::XML::Builder.new do |xml|
        xml.root('xmlns:dt' => 'http://eccairsportal.jrc.ec.europa.eu/ECCAIRS5_dataTypes.xsd') do
          instance = test_text_class.new("test & <value>")
          instance.build_xml(xml)
        end
      end

      xml = xml_builder.to_xml
      expect(xml).to include("Test_Text")
      expect(xml).to include("<dt:PlainText>")
      # Nokogiri should escape special characters
      expect(xml).to include("&amp;")
      expect(xml).to include("&lt;")
      expect(xml).to include("&gt;")
    end

    it "does not generate XML for nil value" do
      xml_builder = Nokogiri::XML::Builder.new
      instance = test_text_class.new(nil)
      instance.build_xml(xml_builder)

      xml = xml_builder.to_xml
      expect(xml).not_to include("Test_Text")
    end

    it "includes unit in XML attributes when set" do
      klass_with_unit = Class.new(described_class) do
        attribute_id "777"
        xml_tag "Text_With_Unit"
        unit "TestUnit"
        text_type true
      end

      xml_builder = Nokogiri::XML::Builder.new do |xml|
        xml.root('xmlns:dt' => 'http://eccairsportal.jrc.ec.europa.eu/ECCAIRS5_dataTypes.xsd') do
          instance = klass_with_unit.new("test value")
          instance.build_xml(xml)
        end
      end

      xml = xml_builder.to_xml
      expect(xml).to include('Unit="TestUnit"')
      expect(xml).to include("<dt:PlainText>test value</dt:PlainText>")
    end
  end

  describe "real-world text attribute" do
    it "validates ReporterSDescription correctly" do
      instance = Eccairs::Attributes::ReporterSDescription.new("Test Description")
      expect(instance.value).to eq("Test Description")
    end

    it "generates valid XML in occurrence" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_reporting_history do |rh|
          rh.add_reporting_description("Test Description")
        end
      end

      xml = set.to_xml
      expect(xml).to include("Reporter_S_Description")
      expect(xml).to include("<dt:PlainText>Test Description</dt:PlainText>")
      expect(xml).to include('attributeId="1092"')
    end

    it "validates successfully in a minimal occurrence" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_reporting_history do |rh|
          rh.add_reporting_description("Test Description")
        end
      end

      errors = set.validate
      expect(errors).to be_empty
    end
  end

  describe "edge cases" do
    let(:test_text_class) do
      Class.new(described_class) do
        attribute_id "999"
        xml_tag "Test_Text"
        max_length 5
        text_type true
      end
    end

    it "handles unicode characters" do
      instance = test_text_class.new("café")
      expect(instance.value).to eq("café")
    end

    it "counts unicode characters correctly for length" do
      # "café" is 4 characters, not 5 bytes
      instance = test_text_class.new("café")
      expect(instance.value.length).to eq(4)
    end

    it "handles newlines" do
      instance = test_text_class.new("a\nb")
      expect(instance.value).to eq("a\nb")
    end

    it "handles tabs" do
      instance = test_text_class.new("a\tb")
      expect(instance.value).to eq("a\tb")
    end

    it "handles whitespace-only strings" do
      instance = test_text_class.new("     ")
      expect(instance.value).to eq("     ")
    end

    it "handles multiline text" do
      multiline_text_class = Class.new(described_class) do
        attribute_id "999"
        xml_tag "Test_Text"
        max_length 50  # Increased to accommodate multiline text
        text_type true
      end
      
      multiline_text = "Line 1\nLine 2\nLine 3"
      instance = multiline_text_class.new(multiline_text)
      expect(instance.value).to eq(multiline_text)
    end
  end

  describe "text_type integration" do
    it "works with text_type DSL method from Attribute" do
      test_class = Class.new(described_class) do
        attribute_id "555"
        xml_tag "Text_Type_Test"
        text_type true
      end

      expect(test_class.text_type).to be true
    end

    it "generates PlainText XML when text_type is true" do
      test_class = Class.new(described_class) do
        attribute_id "555"
        xml_tag "Text_Type_Test"
        text_type true
      end

      xml_builder = Nokogiri::XML::Builder.new do |xml|
        xml.root('xmlns:dt' => 'http://eccairsportal.jrc.ec.europa.eu/ECCAIRS5_dataTypes.xsd') do
          instance = test_class.new("test content")
          instance.build_xml(xml)
        end
      end

      xml = xml_builder.to_xml
      expect(xml).to include("<dt:PlainText>test content</dt:PlainText>")
    end
  end

  describe "comparison with StringAttribute" do
    let(:string_class) do
      Class.new(Eccairs::Base::StringAttribute) do
        attribute_id "888"
        xml_tag "String_Test"
        max_length 10
      end
    end

    let(:text_class) do
      Class.new(described_class) do
        attribute_id "999"
        xml_tag "Text_Test"
        max_length 10
        text_type true
      end
    end

    it "both validate string types" do
      expect { string_class.new("valid") }.not_to raise_error
      expect { text_class.new("valid") }.not_to raise_error
    end

    it "both validate max_length" do
      expect { string_class.new("12345678901") }.to raise_error(ArgumentError, /exceeds maximum/)
      expect { text_class.new("12345678901") }.to raise_error(ArgumentError, /exceeds maximum/)
    end

    it "generates different XML structures" do
      string_xml = Nokogiri::XML::Builder.new do |xml|
        xml.root do
          string_instance = string_class.new("test")
          string_instance.build_xml(xml)
        end
      end

      text_xml = Nokogiri::XML::Builder.new do |xml|
        xml.root('xmlns:dt' => 'http://eccairsportal.jrc.ec.europa.eu/ECCAIRS5_dataTypes.xsd') do
          text_instance = text_class.new("test")
          text_instance.build_xml(xml)
        end
      end

      expect(string_xml.to_xml).to include(">test</String_Test>")
      expect(text_xml.to_xml).to include("<dt:PlainText>test</dt:PlainText>")
    end
  end
end
