# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::Aircraft::Propeller::Attributes::CyclesSinceInsp do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("904")
    end
  end

  describe "ECCAIRS report validation" do
    it "generates a valid ECCAIRS report with cycles_since_insp" do
      report = Eccairs.report

      report.add_entity(described_class.new(500))

      expect(report.valid?).to be true
    end
  end
end
