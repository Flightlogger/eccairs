# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Eccairs::Occurrence::Entities::AerodromeGeneral::Narrative" do
  describe "ECCAIRS report validation" do
    it "generates a valid ECCAIRS report with nested Narrative entity under Aerodrome_General" do
      report = Eccairs.report

      report.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::LocationIndicator.new("1000"))
      report.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Narrative::Attributes::NarrativeLanguage.new(1))
      report.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Narrative::Attributes::NarrativeText.new("Test narrative text"))

      expect(report.valid?).to be true
    end
  end
end
