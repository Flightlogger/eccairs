# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Attributes::FileNumber do
  describe "class configuration" do
    it "has correct attribute_id" do
      expect(described_class.attribute_id).to eq("452")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("File_Number")
    end

    it "inherits from StringAttribute" do
      expect(described_class.superclass).to eq(Eccairs::Base::StringAttribute)
    end
  end
  
  describe "initialization" do
    it "creates an instance with a value" do
      instance = described_class.new("test value")
      expect(instance.value).to eq("test value")
    end
  end
  
  describe "XML generation in occurrence" do
    it "generates valid XML within an occurrence" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_file_number("test value")
      end

      xml = set.to_xml
      expect(xml).to include("File_Number")
      expect(xml).to include('attributeId="452"')
    end

    it "validates successfully in a minimal occurrence" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_file_number("test value")
      end

      errors = set.validate
      expect(errors).to be_empty, "Expected no validation errors, got: #{errors.map(&:message).join(', ')}"
    end
  end
end
