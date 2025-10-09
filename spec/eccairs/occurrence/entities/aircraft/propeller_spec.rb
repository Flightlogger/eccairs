# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::Aircraft::Propeller do
  describe ".entity_id" do
    it "returns the correct entity_id" do
      expect(described_class.entity_id).to eq("29")
    end
  end

  describe "ECCAIRS report validation" do
    it "generates a valid ECCAIRS report with propeller entity" do
      report = Eccairs.report

      report.add_entity(Eccairs::Occurrence::Entities::Aircraft::Propeller::Attributes::PropSerial.new("PROP123"))

      expect(report.valid?).to be true
    end
  end
end
