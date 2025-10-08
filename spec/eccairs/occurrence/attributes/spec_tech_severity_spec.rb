# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Attributes::SpecTechSeverity do
  describe "#initialize" do
    it "initializes with nil value by default" do
      entity = described_class.new
      expect(entity.value).to be_nil
    end

    it "initializes with provided value" do
          entity = described_class.new(1)
          expect(entity.value).to eq(1)
  end
end

describe ".attribute_id" do
  it "returns attribute ID of 1080" do
    expect(described_class.attribute_id).to eq("1080")
  end
end

describe "#build_xml" do
  it "generates valid XML with value" do
          entity = described_class.new(1)
    builder = Nokogiri::XML::Builder.new
    entity.build_xml(builder)
    xml = builder.to_xml
    
    expect(xml).to include("Spec_Tech_Severity")
    expect(xml).to include('attributeId="1080"')
  end

  it "does not generate XML when value is nil" do
    entity = described_class.new
    builder = Nokogiri::XML::Builder.new
    entity.build_xml(builder)
    xml = builder.to_xml
    
    expect(xml).not_to include("Spec_Tech_Severity")
  end
end

describe "validation" do
  it "accepts valid values" do
            expect { described_class.new(1) }.not_to raise_error
            expect { described_class.new(2) }.not_to raise_error
            expect { described_class.new(3) }.not_to raise_error
  end

  it "raises error with invalid value" do
    expect { described_class.new(99999) }.to raise_error(Eccairs::ValidationError)
  end

  it "accepts nil value (optional attribute)" do
    expect { described_class.new(nil) }.not_to raise_error
  end
end

describe "ECCAIRS report validation" do
  it "generates a valid ECCAIRS report" do
    report = Eccairs.report
    entity = described_class.new(1)
    report.add_entity(entity)
    
    expect(report.valid?).to be true
  end
end
end
