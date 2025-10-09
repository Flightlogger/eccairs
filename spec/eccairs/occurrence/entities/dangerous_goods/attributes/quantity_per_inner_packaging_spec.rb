# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::DangerousGoods::Attributes::QuantityPerInnerPackaging do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("1060")
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with quantity_per_inner_packaging" do
      set = Eccairs.set

      set.add_entity(described_class.new(100))

      expect(set.valid?).to be true
    end
  end
end
