# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::Aircraft::PartInformation::Attributes::TimeSinceNew do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("660")
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with time_since_new" do
      set = Eccairs.set

      set.add_entity(described_class.new(1500.5))

      expect(set.valid?).to be true
    end
  end
end
