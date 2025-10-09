# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::Aircraft::Propeller::Attributes::DateOfOverhaul do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("906")
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with date_of_overhaul" do
      set = Eccairs.set

      set.add_entity(described_class.new("2021-08-15"))

      expect(set.valid?).to be true
    end
  end
end
