# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::ReportingHistory::Attributes::TrackingSheetNumber do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("1071")
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with tracking_sheet_number" do
      set = Eccairs.set

      set.add_entity(described_class.new("TRACK-001"))

      expect(set.valid?).to be true
    end
  end
end
