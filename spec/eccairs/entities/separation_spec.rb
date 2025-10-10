# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Entities::Separation do
  describe "class configuration" do
    it "has correct entity_id" do
      expect(described_class.entity_id).to eq("34")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("Separation")
    end

    it "inherits from Entity" do
      expect(described_class.superclass).to eq(Eccairs::Base::Entity)
    end
  end

  describe "XML generation" do
    it "generates valid XML within a report" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_separation do |entity|
          # Empty entity
        end
      end

      xml = set.to_xml
      expect(xml).to include("Separation")
      expect(xml).to include('entityId="34"')
    end

    it "validates successfully in a minimal report" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_separation do |entity|
          # Empty entity
        end
      end

      errors = set.validate
      expect(errors).to be_empty, "Expected no validation errors, got: #{errors.map(&:message).join(", ")}"
    end
  end
end
