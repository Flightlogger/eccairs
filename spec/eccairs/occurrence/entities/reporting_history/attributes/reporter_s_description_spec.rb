# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::ReportingHistory::Attributes::ReporterSDescription do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("1092")
    end
  end

  describe "ECCAIRS report validation" do
    it "generates a valid ECCAIRS report with reporter_s_description" do
      report = Eccairs.report

      report.add_entity(described_class.new("Reporter Description"))

      expect(report.valid?).to be true
    end
  end
end
