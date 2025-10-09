# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::RiskAssessment::Attributes::RiskMethod do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("939")
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with risk_method" do
      set = Eccairs.set

      set.add_entity(described_class.new(1))

      expect(set.valid?).to be true
    end
  end
end
