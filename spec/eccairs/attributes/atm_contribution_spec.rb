# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Attributes::AtmContribution do
  describe "class configuration" do
    it "has correct attribute_id" do
      expect(described_class.attribute_id).to eq("428")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("ATM_Contribution")
    end

    it "inherits from EnumAttribute" do
      expect(described_class.superclass).to eq(Eccairs::Base::EnumAttribute)
    end
  end

  describe "initialization" do
    it "creates an instance with a value" do
      instance = described_class.new("2")
      expect(instance.value).to eq(2)
    end
  end

  describe "XML generation in occurrence" do
    it "generates valid XML within an occurrence" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_atm_contribution("2")
      end

      xml = set.to_xml
      expect(xml).to include("ATM_Contribution")
      expect(xml).to include('attributeId="428"')
    end

    it "validates successfully in a minimal occurrence" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_atm_contribution("2")
      end

      errors = set.validate
      expect(errors).to be_empty, "Expected no validation errors, got: #{errors.map(&:message).join(", ")}"
    end
  end
end
