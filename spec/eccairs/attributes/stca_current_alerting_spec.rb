# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Attributes::StcaCurrentAlerting do
  describe "class configuration" do
    it "has correct attribute_id" do
      expect(described_class.attribute_id).to eq("379")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("STCA_Current_Alerting")
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
        occurrence.add_air_navigation_service do |ans|
          ans.add_stca_current_alerting("1")
        end
      end

      xml = set.to_xml
      expect(xml).to include("STCA_Current_Alerting")
      expect(xml).to include('attributeId="379"')
    end

    it "validates successfully in a minimal occurrence" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_air_navigation_service do |ans|
          ans.add_stca_current_alerting("1")
        end
      end

      errors = set.validate
      expect(errors).to be_empty, "Expected no validation errors, got: #{errors.map(&:message).join(', ')}"
    end
  end
end
