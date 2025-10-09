# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::DangerousGoods::Attributes::OriginOfGoods do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("1051")
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with origin_of_goods" do
      set = Eccairs.set

      set.add_entity(described_class.new("Test Origin"))

      expect(set.valid?).to be true
    end
  end
end
