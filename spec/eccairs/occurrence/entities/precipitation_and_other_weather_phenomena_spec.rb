# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::PrecipitationAndOtherWeatherPhenomena do
  describe ".entity_id" do
    it "returns the correct entity_id" do
      expect(described_class.entity_id).to eq("28")
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with precipitation_and_other_weather_phenomena entity" do
      set = Eccairs.set

      set.add_entity(Eccairs::Occurrence::Entities::PrecipitationAndOtherWeatherPhenomena::Attributes::PhenomenonType.new(1))

      expect(set.valid?).to be true
    end
  end
end
