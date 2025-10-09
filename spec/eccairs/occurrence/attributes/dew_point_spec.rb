# frozen_string_literal: true

require "nokogiri"

RSpec.describe Eccairs::Occurrence::Attributes::DewPoint do
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
    it "returns attribute ID of 85" do
      expect(described_class.attribute_id).to eq("85")
    end
  end

  describe "#build_xml" do
    it "generates valid XML with value" do
      entity = described_class.new(15.5)
      builder = Nokogiri::XML::Builder.new do |xml|
        entity.build_xml(xml)
      end

      xml_string = builder.to_xml
      expect(xml_string).to include("<Dew_Point")
      expect(xml_string).to include('attributeId="85"')
      expect(xml_string).to include('Unit="C"')
      expect(xml_string).to include(">15.5</Dew_Point>")
    end

    it "does not generate XML when value is nil" do
      entity = described_class.new
      builder = Nokogiri::XML::Builder.new do |xml|
        entity.build_xml(xml)
      end

      xml_string = builder.to_xml
      expect(xml_string).not_to include("Dew_Point")
    end

    it "includes correct Unit attribute" do
      entity = described_class.new(20.0)
      builder = Nokogiri::XML::Builder.new do |xml|
        entity.build_xml(xml)
      end

      xml_string = builder.to_xml
      expect(xml_string).to include('Unit="C"')
    end

    it "includes correct attributeId" do
      entity = described_class.new(20.0)
      builder = Nokogiri::XML::Builder.new do |xml|
        entity.build_xml(xml)
      end

      xml_string = builder.to_xml
      expect(xml_string).to include('attributeId="85"')
    end
  end

  describe "validation" do
    it "accepts valid value within range (-100 to 100)" do
      expect {
        described_class.new(15.5)
      }.not_to raise_error
    end

    it "accepts minimum value (-100)" do
      expect {
        described_class.new(-100)
      }.not_to raise_error
    end

    it "accepts maximum value (100)" do
      expect {
        described_class.new(100)
      }.not_to raise_error
    end

    it "raises error with value above maximum (100)" do
      expect {
        described_class.new(150)
      }.to raise_error(Eccairs::ValidationError, /less than or equal to 100/)
    end

    it "raises error with value below minimum (-100)" do
      expect {
        described_class.new(-150)
      }.to raise_error(Eccairs::ValidationError, /greater than or equal to -100/)
    end

    it "accepts nil value (optional attribute)" do
      expect {
        described_class.new
      }.not_to raise_error
    end

    it "accepts decimal values" do
      expect {
        described_class.new(15.567)
      }.not_to raise_error
    end

    it "accepts negative decimal values" do
      expect {
        described_class.new(-25.789)
      }.not_to raise_error
    end

    it "accepts zero value" do
      expect {
        described_class.new(0)
      }.not_to raise_error
    end

    it "raises error when setting invalid value after initialization" do
      entity = described_class.new
      expect {
        entity.value = 200
      }.to raise_error(Eccairs::ValidationError, /less than or equal to 100/)
    end

    it "allows correcting value after error" do
      entity = described_class.new
      expect {
        entity.value = 200
      }.to raise_error(Eccairs::ValidationError)

      # Should be able to set a valid value
      expect {
        entity.value = 50
      }.not_to raise_error

      expect(entity.value).to eq(50)
    end

    it "raises error with non-numeric value" do
      expect {
        described_class.new("not a number")
      }.to raise_error(Eccairs::ValidationError, /must be a number/)
    end

    it "provides helpful error message with actual value" do
      expect {
        described_class.new(150)
      }.to raise_error(Eccairs::ValidationError, /got 150/)
    end
  end

  describe "ECCAIRS report validation" do
    it "generates a valid ECCAIRS report" do
      report = Eccairs.report
      entity = described_class.new(15.5)
      report.add_entity(entity)

      expect(report.valid?).to be true
    end
  end
end
