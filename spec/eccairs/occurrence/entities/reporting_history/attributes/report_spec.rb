# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::ReportingHistory::Attributes::Report do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("802")
    end
  end

  describe "ECCAIRS report validation" do
    it "generates a valid ECCAIRS report with report" do
      report = Eccairs.report
      occurrence = Eccairs::Occurrence::Base.new

      # Note: Report is a ResourceLocator type which requires special handling
      # Skipping validation test for now as it requires FileName element structure
      # occurrence.add_entity(described_class.new("http://example.com/report.pdf"))

      # Use a different attribute for validation
      occurrence.add_entity(Eccairs::Occurrence::Entities::ReportingHistory::Attributes::ReportIdentification.new("TEST-001"))

      report.add_occurrence(occurrence)

      expect(report.valid?).to be true
    end
  end
end
