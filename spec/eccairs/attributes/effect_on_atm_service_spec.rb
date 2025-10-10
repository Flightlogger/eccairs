# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Attributes::EffectOnAtmService do
  describe "class configuration" do
    it "has correct attribute_id" do
      expect(described_class.attribute_id).to eq("436")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("Effect_On_ATM_Service")
    end

    it "inherits from EnumAttribute" do
      expect(described_class.superclass).to eq(Eccairs::Base::EnumAttribute)
    end
  end

  describe "initialization" do
    it "creates an instance with a value" do
      instance = described_class.new("1")
      expect(instance.value).to eq("1")
    end
  end

  describe "XML generation in occurrence" do
    it "generates valid XML within an occurrence" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_effect_on_atm_service("1")
      end

      xml = set.to_xml
      expect(xml).to include("Effect_On_ATM_Service")
      expect(xml).to include('attributeId="436"')
    end

    it "validates successfully in a minimal occurrence" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_effect_on_atm_service("1")
      end

      errors = set.validate
      expect(errors).to be_empty, "Expected no validation errors, got: #{errors.map(&:message).join(", ")}"
    end
  end
end
