# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::ReportingHistory do
  describe ".entity_id" do
    it "returns the correct entity_id" do
      expect(described_class.entity_id).to eq("53")
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with reporting_history entity" do
      set = Eccairs.set

      set.add_entity(Eccairs::Occurrence::Entities::ReportingHistory::Attributes::ReportIdentification.new("TEST-001"))

      expect(set.valid?).to be true
    end
  end
end
