# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::AerodromeGeneral do
  describe ".entity_id" do
    it "returns the correct entity_id" do
      expect(described_class.entity_id).to eq("1")
    end
  end

  describe ".xml_tag" do
    it "returns the correct xml_tag" do
      expect(described_class.xml_tag).to eq("Aerodrome_General")
    end
  end
end
