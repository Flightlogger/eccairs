# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::Aircraft::Entities::Propeller::Attributes::PropellerModel do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("493")
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with propeller_model" do
      set = Eccairs.set

      set.add_entity(described_class.new("Hartzell HC-B3TN-3D"))

      expect(set.valid?).to be true
    end
  end
end
