# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::AirNavigationService do
  describe ".entity_id" do
    it "returns the correct entity_id" do
      expect(described_class.entity_id).to eq("10")
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with air_navigation_service entity" do
      set = Eccairs.set

      set.add_entity(Eccairs::Occurrence::Entities::AirNavigationService::Attributes::AnspName.new("Test ATS Unit"))

      expect(set.valid?).to be true
    end
  end
end
