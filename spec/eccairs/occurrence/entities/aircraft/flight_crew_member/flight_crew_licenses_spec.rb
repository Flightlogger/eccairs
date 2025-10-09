# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::Aircraft::FlightCrewMember::FlightCrewLicenses do
  describe ".entity_id" do
    it "returns the correct entity_id" do
      expect(described_class.entity_id).to eq("16")
    end
  end

  describe "ECCAIRS report validation" do
    it "generates a valid ECCAIRS report with flight_crew_licenses entity" do
      report = Eccairs.report

      report.add_entity(Eccairs::Occurrence::Entities::Aircraft::FlightCrewMember::FlightCrewLicenses::Attributes::Validity.new(1))

      expect(report.valid?).to be true
    end
  end
end
