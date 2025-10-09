# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::AirSpace::Narrative::Attributes::NarrativeText do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("425")
    end
  end

  describe "ECCAIRS report validation" do
    it "generates a valid ECCAIRS report with narrative_text" do
      report = Eccairs.report
      occurrence = Eccairs::Occurrence::Base.new

      occurrence.add_entity(Eccairs::Occurrence::Entities::AirSpace::Attributes::AirspaceClass.new(1))
      occurrence.add_entity(described_class.new("This is a test narrative describing the airspace incident."))

      report.add_occurrence(occurrence)

      expect(report.valid?).to be true
    end
  end
end

