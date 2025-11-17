# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Base::StringAttribute do
  describe "class configuration" do
    describe ".max_length" do
      let(:test_string_class) do
        Class.new(described_class) do
          attribute_id "999"
          xml_tag "Test_String"
          max_length 50
        end
      end

      it "sets max_length" do
        expect(test_string_class.max_length).to eq(50)
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

  describe "validation" do
    let(:test_string_class) do
      Class.new(described_class) do
        attribute_id "999"
        xml_tag "Test_String"
        max_length 10
      end
    end

    describe "type validation" do
      it "accepts string values" do
        instance = test_string_class.new("hello")
        expect(instance.value).to eq("hello")
      end

      it "rejects non-string values" do
        instance = test_string_class.new(123)
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/must be a string/)
      end

      it "rejects integer" do
        instance = test_string_class.new(42)
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/must be a string/)
      end

      it "rejects float" do
        instance = test_string_class.new(3.14)
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/must be a string/)
      end

      it "rejects array" do
        instance = test_string_class.new([1, 2, 3])
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/must be a string/)
      end

      it "rejects hash" do
        instance = test_string_class.new({key: "value"})
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/must be a string/)
      end

      it "rejects symbol" do
        instance = test_string_class.new(:symbol)
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/must be a string/)
      end
    end

    describe "length validation" do
      it "accepts string within max_length" do
        instance = test_string_class.new("short")
        expect(instance.value).to eq("short")
      end

      it "accepts string exactly at max_length" do
        instance = test_string_class.new("1234567890")
        expect(instance.value).to eq("1234567890")
      end

      it "rejects string exceeding max_length" do
        instance = test_string_class.new("12345678901")
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/exceeds maximum/)
      end

      it "accepts empty string" do
        instance = test_string_class.new("")
        expect(instance.value).to eq("")
      end

      it "includes actual and max length in error message" do
        instance = test_string_class.new("12345678901")
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/length 11 exceeds maximum of 10/)
      end
    end

    describe "without max_length constraint" do
      let(:unlimited_string_class) do
        Class.new(described_class) do
          attribute_id "888"
          xml_tag "Unlimited_String"
        end
      end

      it "accepts any length string" do
        long_string = "a" * 10000
        instance = unlimited_string_class.new(long_string)
        expect(instance.value).to eq(long_string)
      end

      it "still validates type" do
        instance = unlimited_string_class.new(123)
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/must be a string/)
      end
    end

    describe "with nil value" do
      it "accepts nil value" do
        instance = test_string_class.new(nil)
        expect(instance.value).to be_nil
      end

      it "does not validate nil" do
        expect { test_string_class.new(nil) }.not_to raise_error
      end
    end

    describe "value assignment" do
      it "validates on value assignment" do
        instance = test_string_class.new("short")
        instance.value = "12345678901"
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/exceeds maximum/)
      end

      it "allows changing to another valid value" do
        instance = test_string_class.new("hello")
        instance.value = "world"
        expect(instance.value).to eq("world")
      end
    end
  end

  describe "XML generation" do
    let(:test_string_class) do
      Class.new(described_class) do
        attribute_id "999"
        xml_tag "Test_String"
        max_length 50
      end
    end

    it "generates XML with string value" do
      xml_builder = Nokogiri::XML::Builder.new
      instance = test_string_class.new("test value")
      instance.build_xml(xml_builder)

      xml = xml_builder.to_xml
      expect(xml).to include("Test_String")
      expect(xml).to include(">test value</Test_String>")
      expect(xml).to include('attributeId="999"')
    end

    it "handles special XML characters" do
      xml_builder = Nokogiri::XML::Builder.new
      instance = test_string_class.new("test & <value>")
      instance.build_xml(xml_builder)

      xml = xml_builder.to_xml
      expect(xml).to include("Test_String")
      # Nokogiri should escape special characters
      expect(xml).to include("&amp;")
      expect(xml).to include("&lt;")
      expect(xml).to include("&gt;")
    end

    it "does not generate XML for nil value" do
      xml_builder = Nokogiri::XML::Builder.new
      instance = test_string_class.new(nil)
      instance.build_xml(xml_builder)

      xml = xml_builder.to_xml
      expect(xml).not_to include("Test_String")
    end
  end

  describe "real-world string attribute" do
    it "validates AircraftRegistration correctly" do
      instance = Eccairs::Attributes::AircraftRegistration.new("N12345")
      expect(instance.value).to eq("N12345")
    end

    it "generates valid XML in occurrence" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft(id: "AC1") do |aircraft|
          aircraft.add_aircraft_registration("N12345")
        end
      end

      xml = set.to_xml
      expect(xml).to include("Aircraft_Registration")
      expect(xml).to include(">N12345</Aircraft_Registration>")
    end

    it "validates successfully" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft(id: "AC1") do |aircraft|
          aircraft.add_aircraft_registration("N12345")
        end
      end

      errors = set.validate
      expect(errors).to be_empty
    end
  end

  describe "edge cases" do
    let(:test_string_class) do
      Class.new(described_class) do
        attribute_id "999"
        xml_tag "Test_String"
        max_length 5
      end
    end

    it "handles unicode characters" do
      instance = test_string_class.new("café")
      expect(instance.value).to eq("café")
    end

    it "counts unicode characters correctly for length" do
      # "café" is 4 characters, not 5 bytes
      instance = test_string_class.new("café")
      expect(instance.value.length).to eq(4)
    end

    it "handles newlines" do
      instance = test_string_class.new("a\nb")
      expect(instance.value).to eq("a\nb")
    end

    it "handles tabs" do
      instance = test_string_class.new("a\tb")
      expect(instance.value).to eq("a\tb")
    end

    it "handles whitespace-only strings" do
      instance = test_string_class.new("     ")
      expect(instance.value).to eq("     ")
    end
  end
end
