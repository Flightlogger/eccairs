# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::AirNavigationService::Narrative::Attributes::NarrativeLanguage do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("424")
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with narrative_language" do
      set = Eccairs.set

      set.add_entity(described_class.new(1))

      expect(set.valid?).to be true
    end
  end
end
