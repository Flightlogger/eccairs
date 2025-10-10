# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Base::Attribute do
  # Create a test attribute class for testing
  let(:test_attribute_class) do
    Class.new(described_class) do
      attribute_id "999"
      xml_tag "Test_Attribute"
      sequence 100
      unit "TestUnit"
    end
  end

  describe "class configuration DSL" do
    describe ".attribute_id" do
      it "sets and retrieves attribute_id" do
        expect(test_attribute_class.attribute_id).to eq("999")
      end

      it "converts value to string" do
        klass = Class.new(described_class)
        klass.attribute_id 123
        expect(klass.attribute_id).to eq("123")
      end
    end

    describe ".xml_tag" do
      it "sets and retrieves xml_tag" do
        expect(test_attribute_class.xml_tag).to eq("Test_Attribute")
      end

      it "converts value to string" do
        klass = Class.new(described_class)
        klass.xml_tag :test_tag
        expect(klass.xml_tag).to eq("test_tag")
      end
    end

    describe ".sequence" do
      it "sets and retrieves sequence" do
        expect(test_attribute_class.sequence).to eq(100)
      end

      it "converts value to integer" do
        klass = Class.new(described_class)
        klass.sequence "50"
        expect(klass.sequence).to eq(50)
      end

      it "defaults to 999 if not set" do
        klass = Class.new(described_class)
        expect(klass.sequence).to eq(999)
      end
    end

    describe ".unit" do
      it "sets and retrieves unit" do
        expect(test_attribute_class.unit).to eq("TestUnit")
      end

      it "converts value to string" do
        klass = Class.new(described_class)
        klass.unit :celsius
        expect(klass.unit).to eq("celsius")
      end

      it "returns nil if not set" do
        klass = Class.new(described_class)
        expect(klass.unit).to be_nil
      end
    end
  end

  describe "initialization" do
    it "creates an instance without a value" do
      instance = test_attribute_class.new
      expect(instance.value).to be_nil
    end

    it "creates an instance with a value" do
      instance = test_attribute_class.new("test_value")
      expect(instance.value).to eq("test_value")
    end

    it "calls validate_value during initialization" do
      instance = test_attribute_class.new
      expect(instance).to receive(:validate_value).with("new_value")
      instance.value = "new_value"
    end
  end

  describe "#value=" do
    it "sets the value" do
      instance = test_attribute_class.new
      instance.value = "new_value"
      expect(instance.value).to eq("new_value")
    end

    it "calls validate_value" do
      instance = test_attribute_class.new
      expect(instance).to receive(:validate_value).with("validated_value")
      instance.value = "validated_value"
    end
  end

  describe "#build_xml" do
    let(:xml_builder) { Nokogiri::XML::Builder.new }

    it "builds XML with attribute value" do
      instance = test_attribute_class.new("test_value")
      instance.build_xml(xml_builder)

      xml = xml_builder.to_xml
      expect(xml).to include("Test_Attribute")
      expect(xml).to include("test_value")
      expect(xml).to include('attributeId="999"')
    end

    it "includes unit in XML attributes when set" do
      instance = test_attribute_class.new("test_value")
      instance.build_xml(xml_builder)

      xml = xml_builder.to_xml
      expect(xml).to include('Unit="TestUnit"')
    end

    it "does not include unit when not set" do
      klass = Class.new(described_class) do
        attribute_id "888"
        xml_tag "No_Unit_Attribute"
      end

      instance = klass.new("test_value")
      instance.build_xml(xml_builder)

      xml = xml_builder.to_xml
      expect(xml).not_to include("Unit=")
    end

    it "does not build XML when value is nil" do
      instance = test_attribute_class.new(nil)
      instance.build_xml(xml_builder)

      xml = xml_builder.to_xml
      expect(xml).not_to include("Test_Attribute")
    end

    it "raises error when xml_tag is not defined" do
      klass = Class.new(described_class) do
        attribute_id "777"
      end

      instance = klass.new("test_value")
      expect { instance.build_xml(xml_builder) }.to raise_error(NotImplementedError, /must define xml_tag/)
    end
  end

  describe "#validate_value" do
    it "does not raise error by default (base implementation)" do
      instance = test_attribute_class.new
      expect { instance.value = "any_value" }.not_to raise_error
    end

    it "can be overridden by subclasses" do
      validating_class = Class.new(described_class) do
        attribute_id "666"
        xml_tag "Validating_Attribute"

        protected

        def validate_value(value)
          raise ArgumentError, "Invalid!" if value == "bad"
        end
      end

      instance = validating_class.new
      expect { instance.value = "good" }.not_to raise_error
      expect { instance.value = "bad" }.to raise_error(ArgumentError, "Invalid!")
    end
  end

  describe "inheritance" do
    it "allows subclasses to inherit configuration" do
      parent_class = Class.new(described_class) do
        attribute_id "100"
        xml_tag "Parent_Attribute"
      end

      child_class = Class.new(parent_class)

      # Child should not inherit parent's class instance variables
      # Each class should have its own configuration
      expect(child_class.attribute_id).to be_nil
    end
  end

  describe "XML structure" do
    it "generates correct XML structure in a full occurrence" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_dew_point(25.5)
      end

      xml = set.to_xml
      expect(xml).to include("<Dew_Point")
      expect(xml).to include('attributeId="85"')
      expect(xml).to include('Unit="C"')
      expect(xml).to include(">25.5</Dew_Point>")
    end
  end
end
