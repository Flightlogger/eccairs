# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::AirSpace::Attributes::AirspaceType do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("15")
    end
  end

  describe "validation" do
    it "accepts valid airspace type values" do
      expect {
        described_class.new(1)
      }.not_to raise_error

      expect {
        described_class.new(12)
      }.not_to raise_error

      expect {
        described_class.new(111)
      }.not_to raise_error
    end

    it "rejects invalid airspace type values" do
      expect {
        described_class.new(0)
      }.to raise_error(Eccairs::ValidationError)

      expect {
        described_class.new(13)
      }.to raise_error(Eccairs::ValidationError)

      expect {
        described_class.new(200)
      }.to raise_error(Eccairs::ValidationError)
    end
  end

  describe "ECCAIRS report validation" do
    it "generates a valid ECCAIRS report with airspace_type" do
      report = Eccairs.report
      occurrence = Eccairs::Occurrence::Base.new

      occurrence.add_entity(described_class.new(1))

      report.add_occurrence(occurrence)

      expect(report.valid?).to be true
    end
  end
end
