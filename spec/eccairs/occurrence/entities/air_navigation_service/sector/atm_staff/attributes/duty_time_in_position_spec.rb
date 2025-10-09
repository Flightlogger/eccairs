# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::AirNavigationService::Sector::AtmStaff::Attributes::DutyTimeInPosition do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("347")
    end
  end

  describe "ECCAIRS report validation" do
    it "generates a valid ECCAIRS report with duty_time_in_position" do
      report = Eccairs.report

      report.add_entity(described_class.new(8.5))

      expect(report.valid?).to be true
    end
  end
end
