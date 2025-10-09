# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::AirSpace::Attributes::SpecialActivities do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("17")
    end
  end

  describe "validation" do
    it "accepts valid special activities values" do
      expect {
        described_class.new(1)
      }.not_to raise_error

      expect {
        described_class.new(6)
      }.not_to raise_error

      expect {
        described_class.new(104)
      }.not_to raise_error
    end

    it "rejects invalid special activities values" do
      expect {
        described_class.new(0)
      }.to raise_error(Eccairs::ValidationError)

      expect {
        described_class.new(7)
      }.to raise_error(Eccairs::ValidationError)

      expect {
        described_class.new(200)
      }.to raise_error(Eccairs::ValidationError)
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with special_activities" do
      set = Eccairs.set

      set.add_entity(described_class.new(1))

      expect(set.valid?).to be true
    end
  end
end
