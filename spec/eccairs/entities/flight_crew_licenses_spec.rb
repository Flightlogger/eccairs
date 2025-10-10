# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Entities::FlightCrewLicenses do
  describe "class configuration" do
    it "has correct entity_id" do
      expect(described_class.entity_id).to eq("16")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("Flight_Crew_Licenses")
    end

    it "inherits from Entity" do
      expect(described_class.superclass).to eq(Eccairs::Base::Entity)
    end
  end

  describe "XML generation" do
    it "generates valid XML within a report" do
      set = Eccairs::Set.new
      set.add_occurrence do |occurrence|
        occurrence.add_file_number("TEST-001")
        occurrence.add_responsible_entity("1")

        occurrence.add_aircraft(id: "AC1") do |aircraft|
          aircraft.add_flight_crew_member do |crew|
            crew.add_flight_crew_licenses do |license|
              license.add_validity("1")
              license.add_license_type("100")
            end
          end
        end
      end

      xml = set.to_xml
      expect(xml).to include("Flight_Crew_Licenses")
      expect(xml).to include("Validity")
    end

    it "validates successfully in a minimal report" do
      set = Eccairs::Set.new
      set.add_occurrence do |occurrence|
        occurrence.add_file_number("TEST-001")
        occurrence.add_responsible_entity("1")

        occurrence.add_aircraft(id: "AC1") do |aircraft|
          aircraft.add_flight_crew_member do |crew|
            crew.add_flight_crew_licenses do |license|
              license.add_validity("1")
            end
          end
        end
      end

      expect(set.valid?).to be true
    end
  end
end
