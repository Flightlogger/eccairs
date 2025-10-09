# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::AirNavigationService::Sector::AtmStaff do
  describe ".entity_id" do
    it "returns the correct entity_id" do
      expect(described_class.entity_id).to eq("9")
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with atm_staff entity" do
      set = Eccairs.set

      set.add_entity(Eccairs::Occurrence::Entities::AirNavigationService::Sector::AtmStaff::Attributes::Category.new(1))

      expect(set.valid?).to be true
    end
  end
end
