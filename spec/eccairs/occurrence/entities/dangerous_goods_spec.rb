# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::DangerousGoods do
  describe ".entity_id" do
    it "returns the correct entity_id" do
      expect(described_class.entity_id).to eq("43")
    end
  end

  describe "ECCAIRS report validation" do
    it "generates a valid ECCAIRS report with dangerous_goods entity" do
      report = Eccairs.report
      occurrence = Eccairs::Occurrence::Base.new

      occurrence.add_entity(Eccairs::Occurrence::Entities::DangerousGoods::Attributes::DangerousGood.new("2"))

      report.add_occurrence(occurrence)

      expect(report.valid?).to be true
    end
  end
end
