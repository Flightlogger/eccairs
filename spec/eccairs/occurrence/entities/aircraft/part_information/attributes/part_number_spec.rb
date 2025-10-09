# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::Aircraft::Entities::PartInformation::Attributes::PartNumber do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("486")
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with part_number" do
      set = Eccairs.set

      set.add_entity(described_class.new("ABC-123-456"))

      expect(set.valid?).to be true
    end
  end
end
