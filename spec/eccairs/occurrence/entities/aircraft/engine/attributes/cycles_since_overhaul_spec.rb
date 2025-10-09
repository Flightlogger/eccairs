# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::Aircraft::Engine::Attributes::CyclesSinceOverhaul do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("886")
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with cycles_since_overhaul" do
      set = Eccairs.set

      set.add_entity(described_class.new(1000))

      expect(set.valid?).to be true
    end
  end
end
