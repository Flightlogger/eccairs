# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::AerodromeGeneral::Vehicle::Attributes::VehicleControlled do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("743")
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
      expect {
        described_class.new(:YES)
      }.not_to raise_error
    end

    it "accepts :NO symbol" do
      expect {
        described_class.new(:NO)
      }.not_to raise_error
    end

    it "accepts :UNKNOWN symbol" do
      expect {
        described_class.new(:UNKNOWN)
      }.not_to raise_error
    end

    it "accepts 'YES' string" do
      expect {
        described_class.new("YES")
      }.not_to raise_error
    end

    it "accepts YES constant" do
      expect {
        described_class.new(described_class::YES)
      }.not_to raise_error
    end

    it "rejects invalid value" do
      expect {
        described_class.new(3)
      }.to raise_error(Eccairs::ValidationError)
    end

    it "rejects invalid symbol" do
      expect {
        described_class.new(:MAYBE)
      }.to raise_error(Eccairs::ValidationError)
    end

    it "rejects invalid string value" do
      expect {
        described_class.new("MAYBE")
      }.to raise_error(Eccairs::ValidationError)
    end

    it "accepts nil value (optional attribute)" do
      expect {
        described_class.new(nil)
      }.not_to raise_error
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with vehicle_controlled" do
      set = Eccairs.set

      set.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::LocationIndicator.new("1000"))
      set.add_entity(described_class.new(1))

      expect(set.valid?).to be true
    end
  end
end
