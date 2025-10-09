# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::Events::Attributes::EventType do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("390")
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with event_type" do
      set = Eccairs.set

      set.add_entity(described_class.new("3000000"))

      expect(set.valid?).to be true
    end
  end
end
