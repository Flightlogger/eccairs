# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::AerodromeGeneral::Narrative::Attributes::NarrativeLanguage do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("424")
    end
  end

  describe "validation" do
    it "accepts valid language values" do
      expect {
        described_class.new(1)
      }.not_to raise_error

      expect {
        described_class.new(33)
      }.not_to raise_error

      expect {
        described_class.new(66)
      }.not_to raise_error
    end

    it "rejects invalid language values" do
      expect {
        described_class.new(0)
      }.to raise_error(Eccairs::ValidationError)

      expect {
        described_class.new(67)
      }.to raise_error(Eccairs::ValidationError)

      expect {
        described_class.new(100)
      }.to raise_error(Eccairs::ValidationError)
    end
  end

  describe "ECCAIRS report validation" do
    it "generates a valid ECCAIRS report with narrative_language" do
      report = Eccairs.report

      report.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::LocationIndicator.new("1000"))
      report.add_entity(described_class.new(1))

      expect(report.valid?).to be true
    end
  end
end
