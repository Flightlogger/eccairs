# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Eccairs::Occurrence::Entities::AerodromeGeneral::Entities::Runway" do
  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with nested Runway entity under Aerodrome_General" do
      set = Eccairs.set

      set.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::LocationIndicator.new("1000"))
      set.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Entities::Runway::Attributes::RunwayIdentifier.new("04L"))
      set.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Entities::Runway::Attributes::SurfaceType.new(1))
      set.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Entities::Runway::Attributes::RunwayNumber.new(4))

      expect(set.valid?).to be true
    end
  end
end
