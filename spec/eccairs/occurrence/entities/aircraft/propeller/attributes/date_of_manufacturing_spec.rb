# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::Aircraft::Propeller::Attributes::DateOfManufacturing do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("905")
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with date_of_manufacturing" do
      set = Eccairs.set

      set.add_entity(described_class.new("2019-05-20"))

      expect(set.valid?).to be true
    end
  end
end
