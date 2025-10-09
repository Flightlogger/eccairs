# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Eccairs::Occurrence::Entities::AerodromeGeneral::Narrative" do
  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with nested Narrative entity under Aerodrome_General" do
      set = Eccairs.set

      set.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::LocationIndicator.new("1000"))
      set.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Narrative::Attributes::NarrativeLanguage.new(1))
      set.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Narrative::Attributes::NarrativeText.new("Test narrative text"))

      expect(set.valid?).to be true
    end
  end
end
