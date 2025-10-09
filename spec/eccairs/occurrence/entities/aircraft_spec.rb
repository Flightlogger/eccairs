# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Eccairs::Occurrence::Entities::Aircraft" do
  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with Aircraft entity" do
      set = Eccairs.set

      set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::CallSign.new("ABC123"))
      set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::AircraftRegistration.new("N12345"))

      expect(set.valid?).to be true
    end
  end
end
