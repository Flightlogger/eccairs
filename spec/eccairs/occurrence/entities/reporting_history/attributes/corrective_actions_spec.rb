# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::ReportingHistory::Attributes::CorrectiveActions do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("1069")
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with corrective_actions" do
      set = Eccairs.set

      set.add_entity(described_class.new("Test Actions"))

      expect(set.valid?).to be true
    end
  end
end
