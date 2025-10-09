# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Eccairs::Occurrence::Entities::AirSpace::Narrative" do
  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with nested Narrative entity under Air Space" do
      set = Eccairs.set

      set.add_entity(Eccairs::Occurrence::Entities::AirSpace::Attributes::AirspaceClass.new(1))
      set.add_entity(Eccairs::Occurrence::Entities::AirSpace::Narrative::Attributes::NarrativeLanguage.new(1))
      set.add_entity(Eccairs::Occurrence::Entities::AirSpace::Narrative::Attributes::NarrativeText.new("Test narrative text"))

      expect(set.valid?).to be true
    end
  end
end
