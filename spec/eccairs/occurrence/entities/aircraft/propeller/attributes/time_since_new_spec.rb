# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::Aircraft::Propeller::Attributes::TimeSinceNew do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("899")
    end
  end

  describe "ECCAIRS report validation" do
    it "generates a valid ECCAIRS report with time_since_new" do
      report = Eccairs.report

      report.add_entity(described_class.new(2500.5))

      expect(report.valid?).to be true
    end
  end
end
