# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::Aircraft::Narrative do
  describe ".entity_id" do
    it "returns the correct entity_id" do
      expect(described_class.entity_id).to eq("22")
    end
  end

  describe "ECCAIRS report validation" do
    it "generates a valid ECCAIRS report with narrative entity" do
      report = Eccairs.report

      report.add_entity(Eccairs::Occurrence::Entities::Aircraft::Narrative::Attributes::NarrativeLanguage.new(1))
      report.add_entity(Eccairs::Occurrence::Entities::Aircraft::Narrative::Attributes::NarrativeText.new("Test narrative"))

      expect(report.valid?).to be true
    end
  end
end
