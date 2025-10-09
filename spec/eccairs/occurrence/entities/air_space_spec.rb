# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Eccairs::Occurrence::Entities::AirSpace" do
  describe "ECCAIRS report validation" do
    it "generates a valid ECCAIRS report with Air Space entity" do
      report = Eccairs.report
      occurrence = Eccairs::Occurrence::Base.new

      occurrence.add_entity(Eccairs::Occurrence::Entities::AirSpace::Attributes::AirspaceClass.new(1))
      occurrence.add_entity(Eccairs::Occurrence::Entities::AirSpace::Attributes::AirspaceName.new("Test Airspace"))

      report.add_occurrence(occurrence)

      expect(report.valid?).to be true
    end
  end
end

