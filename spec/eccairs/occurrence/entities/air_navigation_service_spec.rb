# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::AirNavigationService do
  describe ".entity_id" do
    it "returns the correct entity_id" do
      expect(described_class.entity_id).to eq("10")
    end
  end

  describe "ECCAIRS report validation" do
    it "generates a valid ECCAIRS report with air_navigation_service entity" do
      report = Eccairs.report
      occurrence = Eccairs::Occurrence::Base.new

      occurrence.add_entity(Eccairs::Occurrence::Entities::AirNavigationService::Attributes::AnspName.new("Test ATS Unit"))

      report.add_occurrence(occurrence)

      expect(report.valid?).to be true
    end
  end
end
