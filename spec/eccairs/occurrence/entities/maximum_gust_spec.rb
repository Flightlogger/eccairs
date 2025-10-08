# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::MaximumGust do
  describe "#initialize" do
    it "initializes with nil value by default" do
      entity = described_class.new
      expect(entity.value).to be_nil
    end

    it "initializes with provided value" do
          entity = described_class.new(15.5)
          expect(entity.value).to eq(15.5)
  end
end

describe ".attribute_id" do
  it "returns attribute ID of 176" do
    expect(described_class.attribute_id).to eq("176")
  end
end

describe "#build_xml" do
  it "generates valid XML with value" do
          entity = described_class.new(15.5)
    builder = Nokogiri::XML::Builder.new
    entity.build_xml(builder)
    xml = builder.to_xml
    
    expect(xml).to include("Maximum_Gust")
    expect(xml).to include('attributeId="176"')
  end

  it "does not generate XML when value is nil" do
    entity = described_class.new
    builder = Nokogiri::XML::Builder.new
    entity.build_xml(builder)
    xml = builder.to_xml
    
    expect(xml).not_to include("Maximum_Gust")
  end
end
end
