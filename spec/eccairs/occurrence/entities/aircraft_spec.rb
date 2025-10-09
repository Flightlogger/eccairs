# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Eccairs::Occurrence::Entities::Aircraft" do
  describe "ECCAIRS report validation" do
    it "generates a valid ECCAIRS report with Aircraft entity" do
      report = Eccairs.report
      occurrence = Eccairs::Occurrence::Base.new

      occurrence.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::CallSign.new("ABC123"))
      occurrence.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::AircraftRegistration.new("N12345"))

      report.add_occurrence(occurrence)

      expect(report.valid?).to be true
    end
  end
end

