# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::Aircraft::Entities::FlightCrewMember::Entities::FlightCrewLicenses do
  describe ".entity_id" do
    it "returns the correct entity_id" do
      expect(described_class.entity_id).to eq("16")
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with flight_crew_licenses entity" do
      set = Eccairs.set

      set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Entities::FlightCrewMember::Entities::FlightCrewLicenses::Attributes::Validity.new(1))

      expect(set.valid?).to be true
    end
  end
end
