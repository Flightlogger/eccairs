# frozen_string_literal: true

require "nokogiri"

RSpec.describe Eccairs::Occurrence::Entities::DangGoodsInvolved do
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
    it "returns attribute ID of 129" do
      expect(described_class.attribute_id).to eq("129")
    end
  end

  describe "#build_xml" do
    it "generates valid XML with value" do
      entity = described_class.new(1)
      builder = Nokogiri::XML::Builder.new do |xml|
        entity.build_xml(xml)
      end

      xml_string = builder.to_xml
      expect(xml_string).to include('<Dang_Goods_Involved')
      expect(xml_string).to include('attributeId="129"')
      expect(xml_string).to include('>1</Dang_Goods_Involved>')
    end

    it "does not generate XML when value is nil" do
      entity = described_class.new
      builder = Nokogiri::XML::Builder.new do |xml|
        entity.build_xml(xml)
      end

      xml_string = builder.to_xml
      expect(xml_string).not_to include('Dang_Goods_Involved')
    end

    it "includes correct attributeId" do
      entity = described_class.new(2)
      builder = Nokogiri::XML::Builder.new do |xml|
        entity.build_xml(xml)
      end

      xml_string = builder.to_xml
      expect(xml_string).to include('attributeId="129"')
    end
  end

  describe "constants" do
    it "defines YES constant" do
      expect(described_class::YES).to eq(1)
    end

    it "defines NO constant" do
      expect(described_class::NO).to eq(2)
    end

    it "defines UNKNOWN constant" do
      expect(described_class::UNKNOWN).to eq(99)
    end
  end

  describe "validation" do
    it "accepts valid value 1 (YES)" do
      expect {
        described_class.new(1)
      }.not_to raise_error
    end

    it "accepts valid value 2 (NO)" do
      expect {
        described_class.new(2)
      }.not_to raise_error
    end

    it "accepts valid value 99 (UNKNOWN)" do
      expect {
        described_class.new(99)
      }.not_to raise_error
    end

    it "accepts :YES symbol" do
      entity = described_class.new(:YES)
      expect(entity.value).to eq(1)
    end

    it "accepts :NO symbol" do
      entity = described_class.new(:NO)
      expect(entity.value).to eq(2)
    end

    it "accepts :UNKNOWN symbol" do
      entity = described_class.new(:UNKNOWN)
      expect(entity.value).to eq(99)
    end

    it "accepts 'YES' string" do
      entity = described_class.new("YES")
      expect(entity.value).to eq(1)
    end

    it "accepts YES constant" do
      entity = described_class.new(described_class::YES)
      expect(entity.value).to eq(1)
    end

    it "raises error with invalid value" do
      expect {
        described_class.new(3)
      }.to raise_error(Eccairs::ValidationError, /must be one of: 1, 2, 99/)
    end

    it "raises error with invalid symbol" do
      expect {
        described_class.new(:MAYBE)
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
        entity.value = 5
      }.to raise_error(Eccairs::ValidationError, /must be one of: 1, 2, 99/)
    end

    it "allows correcting value after error" do
      entity = described_class.new
      expect {
        entity.value = "invalid"
      }.to raise_error(Eccairs::ValidationError)

      # Should be able to set a valid value
      expect {
        entity.value = :YES
      }.not_to raise_error

      expect(entity.value).to eq(1)
    end

    it "provides helpful error message with actual value" do
      expect {
        described_class.new("invalid")
      }.to raise_error(Eccairs::ValidationError, /got invalid/)
    end
  end
end
