# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::ElevationAboveMsl do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("4")
    end
  end

  describe "ECCAIRS report validation" do
    it "generates a valid ECCAIRS report with elevation_above_msl" do
      report = Eccairs.report

      report.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::LocationIndicator.new("1000"))
      report.add_entity(described_class.new(13.0))

      expect(report.valid?).to be true
    end
  end
end
