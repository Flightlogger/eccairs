# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Attributes::LocalDate do
  describe "#initialize" do
    it "initializes with nil value by default" do
      entity = described_class.new
      expect(entity.value).to be_nil
    end

    it "initializes with provided value" do
      entity = described_class.new("test value")
      expect(entity.value).to eq("test value")
    end
  end

  describe ".attribute_id" do
    it "returns attribute ID of 433" do
      expect(described_class.attribute_id).to eq("433")
    end
  end

  describe "#build_xml" do
    it "generates valid XML with value" do
      entity = described_class.new("test value")
      builder = Nokogiri::XML::Builder.new
      entity.build_xml(builder)
      xml = builder.to_xml

      expect(xml).to include("Local_Date")
      expect(xml).to include('attributeId="433"')
    end

    it "does not generate XML when value is nil" do
      entity = described_class.new
      builder = Nokogiri::XML::Builder.new
      entity.build_xml(builder)
      xml = builder.to_xml

      expect(xml).not_to include("Local_Date")
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set" do
      set = Eccairs.set
      entity = described_class.new("2024-01-01")
      set.add_entity(entity)

      expect(set.valid?).to be true
    end
  end
end
