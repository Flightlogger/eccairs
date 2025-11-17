# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Attributes::ErcsComments do
  describe "class configuration" do
    it "has correct attribute_id" do
      expect(described_class.attribute_id).to eq("1110")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("ERCS_Comments")
    end

    it "inherits from StringAttribute" do
      expect(described_class.superclass).to eq(Eccairs::Base::StringAttribute)
    end

    it "has text_type enabled" do
      expect(described_class.text_type).to be true
    end
  end

  describe "initialization" do
    it "creates an instance with a string value" do
      instance = described_class.new("Test comment")
      expect(instance.value).to eq("Test comment")
    end

    it "accepts nil value" do
      instance = described_class.new(nil)
      expect(instance.value).to be_nil
    end
  end

  describe "XML generation in risk assessment" do
    it "generates valid XML within a risk assessment" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_risk_assessment do |risk_assessment|
          risk_assessment.add_ercs_comments("ERCS comment text")
        end
      end

      xml = set.to_xml
      expect(xml).to include("ERCS_Comments")
      expect(xml).to include('attributeId="1110"')
      expect(xml).to include("ERCS comment text")
    end

    it "validates successfully in a minimal occurrence" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_risk_assessment do |risk_assessment|
          risk_assessment.add_ercs_comments("ERCS comment")
        end
      end

      errors = set.validate
      expect(errors).to be_empty, "Expected no validation errors, got: #{errors.map(&:message).join(", ")}"
    end
  end
end
