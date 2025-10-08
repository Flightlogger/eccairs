# frozen_string_literal: true

require "nokogiri"

RSpec.describe Eccairs::Occurrence::DewPoint do
  describe "#initialize" do
    it "initializes with nil dew_point by default" do
      occurrence = described_class.new
      expect(occurrence.dew_point).to be_nil
    end

    it "initializes with provided dew_point value" do
      occurrence = described_class.new(dew_point: 15.5)
      expect(occurrence.dew_point).to eq(15.5)
    end
  end

  describe ".attribute_id" do
    it "returns attribute ID of 85" do
      expect(described_class.attribute_id).to eq("85")
    end
  end

  describe ".entity_id" do
    it "inherits entity ID of 24 from BaseOccurrence" do
      expect(described_class.entity_id).to eq("24")
    end
  end

  describe "#to_xml" do
    it "generates valid XML with dew_point value" do
      occurrence = described_class.new(dew_point: 15.5)
      builder = Nokogiri::XML::Builder.new do |xml|
        occurrence.to_xml(xml)
      end

      xml_string = builder.to_xml
      expect(xml_string).to include('<Occurrence entityId="24">')
      expect(xml_string).to include('<ATTRIBUTES>')
      expect(xml_string).to include('<Dew_Point Unit="C" attributeId="85">15.5</Dew_Point>')
    end

    it "generates XML without Dew_Point element when value is nil" do
      occurrence = described_class.new
      builder = Nokogiri::XML::Builder.new do |xml|
        occurrence.to_xml(xml)
      end

      xml_string = builder.to_xml
      expect(xml_string).to include('<Occurrence entityId="24">')
      expect(xml_string).to include('<ATTRIBUTES/>')
      expect(xml_string).not_to include('Dew_Point')
    end

    it "includes correct Unit attribute" do
      occurrence = described_class.new(dew_point: 20.0)
      builder = Nokogiri::XML::Builder.new do |xml|
        occurrence.to_xml(xml)
      end

      xml_string = builder.to_xml
      expect(xml_string).to include('Unit="C"')
    end

    it "includes correct attributeId" do
      occurrence = described_class.new(dew_point: 20.0)
      builder = Nokogiri::XML::Builder.new do |xml|
        occurrence.to_xml(xml)
      end

      xml_string = builder.to_xml
      expect(xml_string).to include('attributeId="85"')
    end
  end

  describe "validation at occurrence level" do
    it "accepts valid value within range (-100 to 100)" do
      expect {
        described_class.new(dew_point: 15.5)
      }.not_to raise_error
    end

    it "accepts minimum value (-100)" do
      expect {
        described_class.new(dew_point: -100)
      }.not_to raise_error
    end

    it "accepts maximum value (100)" do
      expect {
        described_class.new(dew_point: 100)
      }.not_to raise_error
    end

    it "raises error with value above maximum (100)" do
      expect {
        described_class.new(dew_point: 150)
      }.to raise_error(Eccairs::ValidationError, /less than or equal to 100/)
    end

    it "raises error with value below minimum (-100)" do
      expect {
        described_class.new(dew_point: -150)
      }.to raise_error(Eccairs::ValidationError, /greater than or equal to -100/)
    end

    it "accepts nil value (optional attribute)" do
      expect {
        described_class.new
      }.not_to raise_error
    end

    it "accepts decimal values" do
      expect {
        described_class.new(dew_point: 15.567)
      }.not_to raise_error
    end

    it "accepts negative decimal values" do
      expect {
        described_class.new(dew_point: -25.789)
      }.not_to raise_error
    end

    it "accepts zero value" do
      expect {
        described_class.new(dew_point: 0)
      }.not_to raise_error
    end

    it "raises error when setting invalid dew_point after initialization" do
      occurrence = described_class.new
      expect {
        occurrence.dew_point = 200
      }.to raise_error(Eccairs::ValidationError, /less than or equal to 100/)
    end

    it "allows correcting value after error" do
      occurrence = described_class.new
      expect {
        occurrence.dew_point = 200
      }.to raise_error(Eccairs::ValidationError)

      # Should be able to set a valid value
      expect {
        occurrence.dew_point = 50
      }.not_to raise_error

      expect(occurrence.dew_point).to eq(50)
    end

    it "raises error with non-numeric value" do
      expect {
        described_class.new(dew_point: "not a number")
      }.to raise_error(Eccairs::ValidationError, /must be a number/)
    end

    it "provides helpful error message with actual value" do
      expect {
        described_class.new(dew_point: 150)
      }.to raise_error(Eccairs::ValidationError, /got 150/)
    end
  end

  describe "validation with report (integration)" do
    it "validates with value within range (-100 to 100)" do
      report = Eccairs.report
      occurrence = described_class.new(dew_point: 15.5)
      report.add_occurrence(occurrence)

      expect(report.valid?).to be true
    end

    it "validates with minimum value (-100)" do
      report = Eccairs.report
      occurrence = described_class.new(dew_point: -100)
      report.add_occurrence(occurrence)

      expect(report.valid?).to be true
    end

    it "validates with maximum value (100)" do
      report = Eccairs.report
      occurrence = described_class.new(dew_point: 100)
      report.add_occurrence(occurrence)

      expect(report.valid?).to be true
    end

    it "cannot create occurrence with value above maximum (100)" do
      expect {
        described_class.new(dew_point: 150)
      }.to raise_error(Eccairs::ValidationError)
    end

    it "cannot create occurrence with value below minimum (-100)" do
      expect {
        described_class.new(dew_point: -150)
      }.to raise_error(Eccairs::ValidationError)
    end

    it "validates with nil value (optional attribute)" do
      report = Eccairs.report
      occurrence = described_class.new
      report.add_occurrence(occurrence)

      expect(report.valid?).to be true
    end

    it "validates with decimal values" do
      report = Eccairs.report
      occurrence = described_class.new(dew_point: 15.567)
      report.add_occurrence(occurrence)

      expect(report.valid?).to be true
    end

    it "validates with negative decimal values" do
      report = Eccairs.report
      occurrence = described_class.new(dew_point: -25.789)
      report.add_occurrence(occurrence)

      expect(report.valid?).to be true
    end

    it "validates with zero value" do
      report = Eccairs.report
      occurrence = described_class.new(dew_point: 0)
      report.add_occurrence(occurrence)

      expect(report.valid?).to be true
    end
  end
end
