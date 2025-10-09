# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::Aircraft::Attributes::TotalNumberFatalities do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("114")
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with total_number_fatalities" do
      set = Eccairs.set

      set.add_entity(described_class.new(0))

      expect(set.valid?).to be true
    end
  end
end
