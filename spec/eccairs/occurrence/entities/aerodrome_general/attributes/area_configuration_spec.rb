# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::AreaConfiguration do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("3")
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with area_configuration" do
      set = Eccairs.set

      set.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::LocationIndicator.new("1000"))
      set.add_entity(described_class.new(1))

      expect(set.valid?).to be true
    end
  end
end
