# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::AirNavigationService::Narrative do
  describe ".entity_id" do
    it "returns the correct entity_id" do
      expect(described_class.entity_id).to eq("22")
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with narrative entity" do
      set = Eccairs.set

      set.add_entity(Eccairs::Occurrence::Entities::AirNavigationService::Narrative::Attributes::NarrativeLanguage.new(1))
      set.add_entity(Eccairs::Occurrence::Entities::AirNavigationService::Narrative::Attributes::NarrativeText.new("Test narrative"))

      expect(set.valid?).to be true
    end
  end
end
