# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::DetectionPhase do
  describe "#initialize" do
    it "initializes with nil value by default" do
      entity = described_class.new
      expect(entity.value).to be_nil
    end

    it "initializes with provided value" do
          entity = described_class.new("test")
          expect(entity.value).to eq("test")
  end
end

describe ".attribute_id" do
  it "returns attribute ID of 1072" do
    expect(described_class.attribute_id).to eq("1072")
  end
end

describe "#build_xml" do
  it "generates valid XML with value" do
          entity = described_class.new("test")
    builder = Nokogiri::XML::Builder.new
    entity.build_xml(builder)
    xml = builder.to_xml
    
    expect(xml).to include("Detection_Phase")
    expect(xml).to include('attributeId="1072"')
  end

  it "does not generate XML when value is nil" do
    entity = described_class.new
    builder = Nokogiri::XML::Builder.new
    entity.build_xml(builder)
    xml = builder.to_xml
    
    expect(xml).not_to include("Detection_Phase")
  end
end
end
