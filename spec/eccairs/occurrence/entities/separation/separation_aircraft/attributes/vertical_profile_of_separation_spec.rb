# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::Separation::SeparationAircraft::Attributes::VerticalProfileOfSeparation do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("598")
    end
  end

  describe "ECCAIRS report validation" do
    it "generates a valid ECCAIRS report with vertical_profile_of_separation" do
      report = Eccairs.report

      report.add_entity(described_class.new(1))

      expect(report.valid?).to be true
    end
  end
end
