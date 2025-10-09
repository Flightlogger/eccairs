# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::Aircraft::Attributes::TotalCyclesAc do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("33")
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with total_cycles_ac" do
      set = Eccairs.set

      set.add_entity(described_class.new(5000))

      expect(set.valid?).to be true
    end
  end
end
