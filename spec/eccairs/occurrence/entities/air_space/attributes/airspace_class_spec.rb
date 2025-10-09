# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::AirSpace::Attributes::AirspaceClass do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("13")
    end
  end

  describe "validation" do
    it "accepts valid airspace class values" do
      expect {
        described_class.new(1)
      }.not_to raise_error

      expect {
        described_class.new(7)
      }.not_to raise_error

      expect {
        described_class.new(99)
      }.not_to raise_error
    end

    it "rejects invalid airspace class values" do
      expect {
        described_class.new(0)
      }.to raise_error(Eccairs::ValidationError)

      expect {
        described_class.new(8)
      }.to raise_error(Eccairs::ValidationError)

      expect {
        described_class.new(200)
      }.to raise_error(Eccairs::ValidationError)
    end
  end

  describe "ECCAIRS report validation" do
    it "generates a valid ECCAIRS report with airspace_class" do
      report = Eccairs.report

      report.add_entity(described_class.new(1))

      expect(report.valid?).to be true
    end
  end
end
