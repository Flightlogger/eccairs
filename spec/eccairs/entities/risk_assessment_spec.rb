# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Entities::RiskAssessment do
  describe "class configuration" do
    it "has correct entity_id" do
      expect(described_class.entity_id).to eq("59")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("Risk_Assessment")
    end

    it "inherits from Entity" do
      expect(described_class.superclass).to eq(Eccairs::Base::Entity)
    end
  end

  describe "XML generation" do
    it "generates valid XML within a report" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_risk_assessment do |entity|
          # Empty entity
        end
      end

      xml = set.to_xml
      expect(xml).to include("Risk_Assessment")
      expect(xml).to include('entityId="59"')
    end

    it "validates successfully in a minimal report" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_risk_assessment do |entity|
          # Empty entity
        end
      end

      errors = set.validate
      expect(errors).to be_empty, "Expected no validation errors, got: #{errors.map(&:message).join(", ")}"
    end
  end

  describe "attribute methods" do
    it "adds ERCS comments" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_risk_assessment do |risk_assessment|
          risk_assessment.add_ercs_comments("Test ERCS comment")
        end
      end

      xml = set.to_xml
      expect(xml).to include("ERCS_Comments")
      expect(xml).to include('attributeId="1110"')
      expect(xml).to include("Test ERCS comment")
    end
  end
end
