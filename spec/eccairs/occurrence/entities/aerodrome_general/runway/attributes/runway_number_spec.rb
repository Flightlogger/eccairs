# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::AerodromeGeneral::Runway::Attributes::RunwayNumber do
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

  describe "ECCAIRS report validation" do
    it "generates a valid ECCAIRS report with runway_number" do
      report = Eccairs.report
      occurrence = Eccairs::Occurrence::Base.new

      occurrence.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::LocationIndicator.new("1000"))
      occurrence.add_entity(described_class.new(1))

      report.add_occurrence(occurrence)

      expect(report.valid?).to be true
    end
  end
end
