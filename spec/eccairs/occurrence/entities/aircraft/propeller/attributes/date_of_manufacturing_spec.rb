# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::Aircraft::Propeller::Attributes::DateOfManufacturing do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("905")
    end
  end

  describe "ECCAIRS report validation" do
    it "generates a valid ECCAIRS report with date_of_manufacturing" do
      report = Eccairs.report

      report.add_entity(described_class.new("2019-05-20"))

      expect(report.valid?).to be true
    end
  end
end
