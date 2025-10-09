# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::AerodromeGeneral::Runway::Attributes::SurfaceType do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("509")
    end
  end

  describe "validation" do
    it "accepts valid surface type values" do
      expect {
        described_class.new(1)
      }.not_to raise_error

      expect {
        described_class.new(6)
      }.not_to raise_error

      expect {
        described_class.new(98)
      }.not_to raise_error

      expect {
        described_class.new(99)
      }.not_to raise_error
    end

    it "rejects invalid surface type values" do
      expect {
        described_class.new(0)
      }.to raise_error(Eccairs::ValidationError)

      expect {
        described_class.new(7)
      }.to raise_error(Eccairs::ValidationError)

      expect {
        described_class.new(100)
      }.to raise_error(Eccairs::ValidationError)
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with surface_type" do
      set = Eccairs.set

      set.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::LocationIndicator.new("1000"))
      set.add_entity(described_class.new(1))

      expect(set.valid?).to be true
    end
  end
end
