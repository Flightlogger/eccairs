# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::Aircraft::Attributes::TotalNumberOfPersons do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("152")
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with total_number_of_persons" do
      set = Eccairs.set

      set.add_entity(described_class.new(150))

      expect(set.valid?).to be true
    end
  end
end
