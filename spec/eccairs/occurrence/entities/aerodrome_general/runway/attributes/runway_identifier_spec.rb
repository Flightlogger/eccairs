# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::AerodromeGeneral::Runway::Attributes::RunwayIdentifier do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("499")
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with runway_identifier" do
      set = Eccairs.set

      set.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::LocationIndicator.new("1000"))
      set.add_entity(described_class.new("09L"))

      expect(set.valid?).to be true
    end
  end
end
