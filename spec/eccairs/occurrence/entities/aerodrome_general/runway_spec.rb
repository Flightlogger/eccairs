# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Eccairs::Occurrence::Entities::AerodromeGeneral::Runway" do
  describe "ECCAIRS report validation" do
    it "generates a valid ECCAIRS report with nested Runway entity under Aerodrome_General" do
      report = Eccairs.report

      report.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::LocationIndicator.new("1000"))
      report.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Runway::Attributes::RunwayIdentifier.new("04L"))
      report.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Runway::Attributes::SurfaceType.new(1))
      report.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Runway::Attributes::RunwayNumber.new(4))

      expect(report.valid?).to be true
    end
  end
end
