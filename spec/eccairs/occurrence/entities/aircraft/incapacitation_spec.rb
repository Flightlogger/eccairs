# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::Aircraft::Incapacitation do
  describe ".entity_id" do
    it "returns the correct entity_id" do
      expect(described_class.entity_id).to eq("20")
    end
  end

  describe "ECCAIRS report validation" do
    it "generates a valid ECCAIRS report with incapacitation entity" do
      report = Eccairs.report

      report.add_entity(Eccairs::Occurrence::Entities::Aircraft::Incapacitation::Attributes::PersonIncapacitated.new(1))

      expect(report.valid?).to be true
    end
  end
end
