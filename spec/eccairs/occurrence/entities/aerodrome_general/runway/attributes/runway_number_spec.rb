# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::AerodromeGeneral::Entities::Runway::Attributes::RunwayNumber do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("1119")
    end
  end

  describe "validation" do
    it "accepts valid runway number values" do
      expect {
        described_class.new(1)
      }.not_to raise_error

      expect {
        described_class.new(72)
      }.not_to raise_error

      expect {
        described_class.new(144)
      }.not_to raise_error
    end

    it "rejects invalid runway number values" do
      expect {
        described_class.new(0)
      }.to raise_error(Eccairs::ValidationError)

      expect {
        described_class.new(145)
      }.to raise_error(Eccairs::ValidationError)

      expect {
        described_class.new(200)
      }.to raise_error(Eccairs::ValidationError)
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with runway_number" do
      set = Eccairs.set

      set.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::LocationIndicator.new("1000"))
      set.add_entity(described_class.new(1))

      expect(set.valid?).to be true
    end
  end
end
