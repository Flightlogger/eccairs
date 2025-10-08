# frozen_string_literal: true

require "nokogiri"

RSpec.describe Eccairs::Occurrence::Entities::WxConditions do
  describe "#initialize" do
    it "initializes with nil value by default" do
      entity = described_class.new
      expect(entity.value).to be_nil
    end

    it "initializes with provided value" do
      entity = described_class.new("1")
      expect(entity.value).to eq("1")
    end
  end

  describe ".attribute_id" do
    it "returns attribute ID of 127" do
      expect(described_class.attribute_id).to eq("127")
    end
  end

  describe "#build_xml" do
    it "generates valid XML with value" do
      entity = described_class.new("1")
      builder = Nokogiri::XML::Builder.new do |xml|
        entity.build_xml(xml)
      end

      xml_string = builder.to_xml
      expect(xml_string).to include('<Wx_Conditions attributeId="127">1</Wx_Conditions>')
    end

    it "does not generate XML when value is nil" do
      entity = described_class.new
      builder = Nokogiri::XML::Builder.new do |xml|
        entity.build_xml(xml)
      end

      xml_string = builder.to_xml
      expect(xml_string).not_to include('Wx_Conditions')
    end

    it "includes correct attributeId" do
      entity = described_class.new("2")
      builder = Nokogiri::XML::Builder.new do |xml|
        entity.build_xml(xml)
      end

      xml_string = builder.to_xml
      expect(xml_string).to include('attributeId="127"')
    end
  end

  describe "validation" do
    it "accepts valid value '1' (VMC)" do
      expect {
        described_class.new("1")
      }.not_to raise_error
    end

    it "accepts valid value '2' (IMC)" do
      expect {
        described_class.new("2")
      }.not_to raise_error
    end

    it "accepts valid value '99' (Unknown)" do
      expect {
        described_class.new("99")
      }.not_to raise_error
    end

    it "accepts VMC constant" do
      expect {
        described_class.new(described_class::VMC)
      }.not_to raise_error
    end

    it "accepts IMC constant" do
      expect {
        described_class.new(described_class::IMC)
      }.not_to raise_error
    end

    it "accepts UNKNOWN constant" do
      expect {
        described_class.new(described_class::UNKNOWN)
      }.not_to raise_error
    end

    it "raises error with invalid value" do
      expect {
        described_class.new("3")
      }.to raise_error(Eccairs::ValidationError, /must be one of: 1, 2, 99/)
    end

    it "raises error with invalid string value" do
      expect {
        described_class.new("invalid")
      }.to raise_error(Eccairs::ValidationError, /must be one of: 1, 2, 99/)
    end

    it "accepts nil value (optional attribute)" do
      expect {
        described_class.new
      }.not_to raise_error
    end

    it "raises error when setting invalid value after initialization" do
      entity = described_class.new
      expect {
        entity.value = "5"
      }.to raise_error(Eccairs::ValidationError, /must be one of: 1, 2, 99/)
    end

    it "allows correcting value after error" do
      entity = described_class.new
      expect {
        entity.value = "invalid"
      }.to raise_error(Eccairs::ValidationError)

      # Should be able to set a valid value
      expect {
        entity.value = "1"
      }.not_to raise_error

      expect(entity.value).to eq("1")
    end

    it "provides helpful error message with actual value" do
      expect {
        described_class.new("invalid")
      }.to raise_error(Eccairs::ValidationError, /got invalid/)
    end
  end

  describe "constants" do
    it "defines VMC constant as '1'" do
      expect(described_class::VMC).to eq("1")
    end

    it "defines IMC constant as '2'" do
      expect(described_class::IMC).to eq("2")
    end

    it "defines UNKNOWN constant as '99'" do
      expect(described_class::UNKNOWN).to eq("99")
    end

    it "defines ALLOWED_VALUES array" do
      expect(described_class::ALLOWED_VALUES).to eq(["1", "2", "99"])
    end

    it "freezes ALLOWED_VALUES array" do
      expect(described_class::ALLOWED_VALUES).to be_frozen
    end
  end
end
