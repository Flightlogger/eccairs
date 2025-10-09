# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::Events do
  describe ".entity_id" do
    it "returns the correct entity_id" do
      expect(described_class.entity_id).to eq("14")
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with events entity" do
      set = Eccairs.set

      set.add_entity(Eccairs::Occurrence::Entities::Events::Attributes::EventType.new("3000000"))

      expect(set.valid?).to be true
    end
  end
end
