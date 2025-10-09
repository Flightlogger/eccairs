# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Eccairs::Occurrence::Entities::Aircraft" do
  describe "ECCAIRS report validation" do
    it "generates a valid ECCAIRS report with Aircraft entity" do
      report = Eccairs.report

      report.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::CallSign.new("ABC123"))
      report.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::AircraftRegistration.new("N12345"))

      expect(report.valid?).to be true
    end
  end
end
