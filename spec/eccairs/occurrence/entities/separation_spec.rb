# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::Separation do
  describe ".entity_id" do
    it "returns the correct entity_id" do
      expect(described_class.entity_id).to eq("34")
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with separation entity" do
      set = Eccairs.set

      set.add_entity(Eccairs::Occurrence::Entities::Separation::Attributes::HorizontalRelMvmt.new(1))

      expect(set.valid?).to be true
    end
  end
end
