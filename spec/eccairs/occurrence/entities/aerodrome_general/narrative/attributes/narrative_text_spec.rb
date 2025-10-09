# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::AerodromeGeneral::Narrative::Attributes::NarrativeText do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("425")
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with narrative_text" do
      set = Eccairs.set

      set.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::LocationIndicator.new("1000"))
      set.add_entity(described_class.new("This is a test narrative describing the incident."))

      expect(set.valid?).to be true
    end
  end
end
