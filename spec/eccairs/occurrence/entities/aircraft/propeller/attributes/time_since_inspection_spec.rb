# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::Aircraft::Entities::Propeller::Attributes::TimeSinceInspection do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("901")
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with time_since_inspection" do
      set = Eccairs.set

      set.add_entity(described_class.new(150.75))

      expect(set.valid?).to be true
    end
  end
end
