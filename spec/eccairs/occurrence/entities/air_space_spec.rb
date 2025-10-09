# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Eccairs::Occurrence::Entities::AirSpace" do
  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with Air Space entity" do
      set = Eccairs.set

      set.add_entity(Eccairs::Occurrence::Entities::AirSpace::Attributes::AirspaceClass.new(1))
      set.add_entity(Eccairs::Occurrence::Entities::AirSpace::Attributes::AirspaceName.new("Test Airspace"))

      expect(set.valid?).to be true
    end
  end
end
