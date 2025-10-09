# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Eccairs::Occurrence::Entities::AerodromeGeneral::Runway" do
  describe "ECCAIRS report validation" do
    it "generates a valid ECCAIRS report with nested Runway entity under Aerodrome_General" do
      report = Eccairs.report
      occurrence = Eccairs::Occurrence::Base.new

      occurrence.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::LocationIndicator.new("1000"))
      occurrence.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Runway::Attributes::RunwayIdentifier.new("04L"))
      occurrence.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Runway::Attributes::SurfaceType.new(1))
      occurrence.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Runway::Attributes::RunwayNumber.new(4))

      report.add_occurrence(occurrence)

      expect(report.valid?).to be true
    end
  end
end
