# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::Aircraft::Attributes::ClearedAltitude do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("58")
    end
  end

  describe "ECCAIRS report validation" do
    it "generates a valid ECCAIRS report with cleared_altitude" do
      report = Eccairs.report

      report.add_entity(described_class.new(10000))

      expect(report.valid?).to be true
    end
  end
end
