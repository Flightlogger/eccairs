# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::Separation::Attributes::VerticalSepRecorded do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("585")
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with vertical_sep_recorded" do
      set = Eccairs.set

      set.add_entity(described_class.new(1000))

      expect(set.valid?).to be true
    end
  end
end
