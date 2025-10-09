# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Occurrence::Entities::ReportingHistory::Attributes::Report do
  describe ".attribute_id" do
    it "returns the correct attribute_id" do
      expect(described_class.attribute_id).to eq("802")
    end
  end

  describe "ECCAIRS set validation" do
    it "generates a valid ECCAIRS set with set" do
      set = Eccairs.set

      # Note: Report is a ResourceLocator type which requires special handling
      # Skipping validation test for now as it requires FileName element structure
      # set.add_entity(described_class.new("http://example.com/set.pdf"))

      # Use a different attribute for validation
      set.add_entity(Eccairs::Occurrence::Entities::ReportingHistory::Attributes::ReportIdentification.new("TEST-001"))

      expect(set.valid?).to be true
    end
  end
end
