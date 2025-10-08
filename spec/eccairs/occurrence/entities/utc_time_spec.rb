# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::UtcTime do
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
  it "returns attribute ID of 478" do
    expect(described_class.attribute_id).to eq("478")
  end
end

describe "#build_xml" do
  it "generates valid XML with value" do
          entity = described_class.new("test value")
    builder = Nokogiri::XML::Builder.new
    entity.build_xml(builder)
    xml = builder.to_xml
    
    expect(xml).to include("UTC_Time")
    expect(xml).to include('attributeId="478"')
  end

  it "does not generate XML when value is nil" do
    entity = described_class.new
    builder = Nokogiri::XML::Builder.new
    entity.build_xml(builder)
    xml = builder.to_xml
    
    expect(xml).not_to include("UTC_Time")
  end
end

describe "ECCAIRS report validation" do
  it "generates a valid ECCAIRS report" do
    report = Eccairs.report
    entity = described_class.new("12:00:00")
    report.add_entity(entity)
    
    expect(report.valid?).to be true
  end
end
end
