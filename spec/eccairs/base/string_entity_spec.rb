# frozen_string_literal: true

RSpec.describe Eccairs::Base::StringEntity do
  describe "inheritance" do
    it "inherits from Entity" do
      expect(described_class.superclass).to eq(Eccairs::Base::Entity)
    end
  end

  describe ".max_length" do
    it "sets and retrieves maximum length" do
      test_class = Class.new(described_class) do
        max_length 100
      end

      expect(test_class.max_length).to eq(100)
    end

    it "returns nil when not set" do
      test_class = Class.new(described_class)
      expect(test_class.max_length).to be_nil
    end
  end

  describe "validation" do
    context "with no constraints" do
      let(:test_class) { Class.new(described_class) }

      it "accepts any string value" do
        expect { test_class.new("short") }.not_to raise_error
        expect { test_class.new("a" * 1000) }.not_to raise_error
        expect { test_class.new("") }.not_to raise_error
      end

      it "accepts nil value" do
        expect { test_class.new(nil) }.not_to raise_error
      end

      it "raises error for non-string values" do
        expect { test_class.new(123) }.to raise_error(
          Eccairs::ValidationError,
          /value must be a string, got Integer/
        )
      end

      it "raises error for symbols" do
        expect { test_class.new(:symbol) }.to raise_error(
          Eccairs::ValidationError,
          /value must be a string, got Symbol/
        )
      end
    end

    context "with max_length constraint" do
      let(:test_class) do
        Class.new(described_class) do
          max_length 10
        end
      end

      it "accepts strings at or below maximum length" do
        expect { test_class.new("") }.not_to raise_error
        expect { test_class.new("short") }.not_to raise_error
        expect { test_class.new("1234567890") }.not_to raise_error
      end

      it "raises error for strings above maximum length" do
        expect { test_class.new("12345678901") }.to raise_error(
          Eccairs::ValidationError,
          /value must be at most 10 characters \(got 11\)/
        )
      end
    end

    context "value assignment after initialization" do
      let(:test_class) do
        Class.new(described_class) do
          max_length 20
        end
      end

      it "validates on assignment" do
        entity = test_class.new("initial")
        expect { entity.value = "updated" }.not_to raise_error
        expect(entity.value).to eq("updated")
      end

      it "raises error when assigning invalid value" do
        entity = test_class.new("initial")
        expect { entity.value = "a" * 21 }.to raise_error(
          Eccairs::ValidationError,
          /value must be at most 20 characters/
        )
      end

      it "allows correcting value after error" do
        entity = test_class.new("initial")
        expect { entity.value = "a" * 21 }.to raise_error(Eccairs::ValidationError)
        expect { entity.value = "valid" }.not_to raise_error
        expect(entity.value).to eq("valid")
      end
    end

    context "unicode and special characters" do
      let(:test_class) do
        Class.new(described_class) do
          max_length 10
        end
      end

      it "counts unicode characters correctly" do
        expect { test_class.new("café") }.not_to raise_error
        expect { test_class.new("🚀" * 10) }.not_to raise_error
        expect { test_class.new("🚀" * 11) }.to raise_error(Eccairs::ValidationError)
      end

      it "accepts strings with newlines and special characters" do
        expect { test_class.new("a\nb") }.not_to raise_error
        expect { test_class.new("tab\there") }.not_to raise_error
      end
    end

    context "empty strings" do
      let(:test_class) do
        Class.new(described_class) do
          max_length 5
        end
      end

      it "accepts empty strings" do
        expect { test_class.new("") }.not_to raise_error
      end
    end
  end

  describe ".wrap_text_in" do
    it "sets and retrieves text wrapper" do
      test_class = Class.new(described_class) do
        wrap_text_in "PlainText"
      end

      expect(test_class.text_wrapper).to eq("PlainText")
    end

    it "returns nil when not set" do
      test_class = Class.new(described_class)
      expect(test_class.text_wrapper).to be_nil
    end
  end

  describe "#build_xml" do
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

    it "does not wrap text when wrap_text_in is not used" do
      test_class = Class.new(described_class) do
        attribute_id 123
        xml_tag :Simple_Text
      end

      entity = test_class.new("Simple value")
      builder = Nokogiri::XML::Builder.new(encoding: "UTF-8") do |xml|
        xml.root do
          entity.build_xml(xml)
        end
      end

      xml_string = builder.to_xml
      expect(xml_string).to include('<Simple_Text attributeId="123">Simple value</Simple_Text>')
      expect(xml_string).not_to include("PlainText")
    end
  end
end
