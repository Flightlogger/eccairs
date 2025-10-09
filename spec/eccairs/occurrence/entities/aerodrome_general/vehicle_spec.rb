# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Eccairs::Occurrence::Entities::AerodromeGeneral::Vehicle" do
  describe "ECCAIRS report validation" do
    it "generates a valid ECCAIRS report with nested Vehicle entity under Aerodrome_General" do
      report = Eccairs.report

      report.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::LocationIndicator.new("1000"))
      report.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Vehicle::Attributes::TypeOfVehicle.new(1))
      report.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Vehicle::Attributes::VehicleControlled.new(1))

      expect(report.valid?).to be true
    end
  end
end
