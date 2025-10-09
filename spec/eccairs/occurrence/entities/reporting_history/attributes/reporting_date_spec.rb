# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::ReportingHistory::Attributes::ReportingDate do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("801")
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with reporting_date" do
      set = Eccairs.set

      set.add_entity(described_class.new("2023-01-01"))

      expect(set.valid?).to be true
    end
  end
end
