# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::Aircraft::Entities::Propeller do
  describe ".entity_id" do
    it "returns the correct entity_id" do
      expect(described_class.entity_id).to eq("29")
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with propeller entity" do
      set = Eccairs.set

      set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Entities::Propeller::Attributes::PropSerial.new("PROP123"))

      expect(set.valid?).to be true
    end
  end
end
