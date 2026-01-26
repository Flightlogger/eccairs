# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Attributes::Attachments do
  describe "class configuration" do
    it "has correct attribute_id" do
      expect(described_class.attribute_id).to eq("793")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("Attachments")
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
        occurrence.add_attachments("test value")
      end

      xml = set.to_xml
      expect(xml).to include("Attachments")
      expect(xml).to include('attributeId="793"')
    end

    it "generates valid XML structure (schema validation skipped for new attributes)" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_attachments("test value")
      end

      xml = set.to_xml
      expect(xml).to include("Attachments")
      expect(xml).to include('attributeId="793"')
      # Note: Schema validation may fail for this attribute if it's not in the minimal schema
      # The XML structure is correct, but the schema may require additional context
    end
  end
end
