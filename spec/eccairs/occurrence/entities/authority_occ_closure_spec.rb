# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::AuthorityOccClosure do
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
  it "returns attribute ID of 1087" do
    expect(described_class.attribute_id).to eq("1087")
  end
end

describe "#build_xml" do
  it "generates valid XML with value" do
          entity = described_class.new("test value")
    builder = Nokogiri::XML::Builder.new
    entity.build_xml(builder)
    xml = builder.to_xml
    
    expect(xml).to include("Authority_Occ_Closure")
    expect(xml).to include('attributeId="1087"')
  end

  it "does not generate XML when value is nil" do
    entity = described_class.new
    builder = Nokogiri::XML::Builder.new
    entity.build_xml(builder)
    xml = builder.to_xml
    
    expect(xml).not_to include("Authority_Occ_Closure")
  end
end

describe "ECCAIRS report validation" do
  it "generates a valid ECCAIRS report with nil value" do
    report = Eccairs.report
    entity = described_class.new(nil)
    report.add_entity(entity)

    expect(report.valid?).to be true
  end
end
end
