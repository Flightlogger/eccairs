# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::ReportingHistory::Attributes::ReportingDate do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("801")
    end
  end

  describe "ECCAIRS report validation" do
    it "generates a valid ECCAIRS report with reporting_date" do
      report = Eccairs.report
      occurrence = Eccairs::Occurrence::Base.new

      occurrence.add_entity(described_class.new("2023-01-01"))

      report.add_occurrence(occurrence)

      expect(report.valid?).to be true
    end
  end
end
