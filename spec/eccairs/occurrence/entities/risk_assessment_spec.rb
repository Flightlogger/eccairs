# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::RiskAssessment do
  describe ".entity_id" do
    it "returns the correct entity_id" do
      expect(described_class.entity_id).to eq("59")
    end
  end

  describe ".xml_tag" do
    it "returns the correct xml_tag" do
      expect(described_class.xml_tag).to eq("Risk_Assessment")
    end
  end
end

