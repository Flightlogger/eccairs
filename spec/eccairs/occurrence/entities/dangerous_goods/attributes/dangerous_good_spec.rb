# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::DangerousGoods::Attributes::DangerousGood do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("688")
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with dangerous_good" do
      set = Eccairs.set

      set.add_entity(described_class.new("2"))

      expect(set.valid?).to be true
    end
  end
end
