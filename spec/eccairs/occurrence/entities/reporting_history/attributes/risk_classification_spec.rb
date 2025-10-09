# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::ReportingHistory::Attributes::RiskClassification do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("1065")
    end
  end

  describe "ECCAIRS report validation" do
    it "generates a valid ECCAIRS report with risk_classification" do
      report = Eccairs.report
      occurrence = Eccairs::Occurrence::Base.new

      occurrence.add_entity(described_class.new("Test Classification"))

      report.add_occurrence(occurrence)

      expect(report.valid?).to be true
    end
  end
end

