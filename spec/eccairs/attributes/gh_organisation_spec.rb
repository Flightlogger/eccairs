# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Attributes::GhOrganisation do
  describe "class configuration" do
    it "has correct attribute_id" do
      expect(described_class.attribute_id).to eq("1116")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("GH_Organisation")
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
        occurrence.add_ground_handling do |gh|
          gh.add_gh_organisation("1")
        end
      end

      xml = set.to_xml
      expect(xml).to include("GH_Organisation")
      expect(xml).to include('attributeId="1116"')
    end

    it "validates successfully in a minimal occurrence" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_ground_handling do |gh|
          gh.add_gh_organisation("1")
        end
      end

      errors = set.validate
      expect(errors).to be_empty, "Expected no validation errors, got: #{errors.map(&:message).join(", ")}"
    end
  end
end
