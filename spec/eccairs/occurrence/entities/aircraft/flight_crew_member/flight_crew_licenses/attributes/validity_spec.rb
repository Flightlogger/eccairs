# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::Aircraft::FlightCrewMember::FlightCrewLicenses::Attributes::Validity do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("397")
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with validity" do
      set = Eccairs.set

      set.add_entity(described_class.new(1))

      expect(set.valid?).to be true
    end
  end
end
