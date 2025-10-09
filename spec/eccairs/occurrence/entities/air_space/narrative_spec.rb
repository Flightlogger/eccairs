# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Eccairs::Occurrence::Entities::AirSpace::Narrative" do
  describe "ECCAIRS report validation" do
    it "generates a valid ECCAIRS report with nested Narrative entity under Air Space" do
      report = Eccairs.report

      report.add_entity(Eccairs::Occurrence::Entities::AirSpace::Attributes::AirspaceClass.new(1))
      report.add_entity(Eccairs::Occurrence::Entities::AirSpace::Narrative::Attributes::NarrativeLanguage.new(1))
      report.add_entity(Eccairs::Occurrence::Entities::AirSpace::Narrative::Attributes::NarrativeText.new("Test narrative text"))

      expect(report.valid?).to be true
    end
  end
end
