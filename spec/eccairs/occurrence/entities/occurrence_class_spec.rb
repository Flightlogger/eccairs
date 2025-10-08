# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::OccurrenceClass do
  describe "#initialize" do
    it "initializes with nil value by default" do
      entity = described_class.new
      expect(entity.value).to be_nil
    end

    it "initializes with provided value" do
          entity = described_class.new(100)
          expect(entity.value).to eq(100)
  end
end

describe ".attribute_id" do
  it "returns attribute ID of 431" do
    expect(described_class.attribute_id).to eq("431")
  end
end

describe "#build_xml" do
  it "generates valid XML with value" do
          entity = described_class.new(100)
    builder = Nokogiri::XML::Builder.new
    entity.build_xml(builder)
    xml = builder.to_xml
    
    expect(xml).to include("Occurrence_Class")
    expect(xml).to include('attributeId="431"')
  end

  it "does not generate XML when value is nil" do
    entity = described_class.new
    builder = Nokogiri::XML::Builder.new
    entity.build_xml(builder)
    xml = builder.to_xml
    
    expect(xml).not_to include("Occurrence_Class")
  end
end

describe "validation" do
  it "accepts valid values" do
            expect { described_class.new(100) }.not_to raise_error
            expect { described_class.new(200) }.not_to raise_error
            expect { described_class.new(300) }.not_to raise_error
  end

  it "raises error with invalid value" do
    expect { described_class.new(99999) }.to raise_error(Eccairs::ValidationError)
  end

  it "accepts nil value (optional attribute)" do
    expect { described_class.new(nil) }.not_to raise_error
  end
end
end
