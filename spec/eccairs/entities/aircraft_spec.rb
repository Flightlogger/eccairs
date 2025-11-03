# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Entities::Aircraft do
  describe "class configuration" do
    it "has correct entity_id" do
      expect(described_class.entity_id).to eq("4")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("Aircraft")
    end

    it "inherits from Entity" do
      expect(described_class.superclass).to eq(Eccairs::Base::Entity)
    end

    it "requires ID attribute" do
      expect(described_class.requires_id?).to be true
    end
  end

  describe "XML generation" do
    it "generates valid XML within a report" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |entity|
          # Empty entity
        end
      end

      xml = set.to_xml
      expect(xml).to include("Aircraft")
      expect(xml).to include('entityId="4"')
    end

    it "validates successfully in a minimal report" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |entity|
          # Empty entity
        end
      end

      errors = set.validate
      expect(errors).to be_empty, "Expected no validation errors, got: #{errors.map(&:message).join(", ")}"
    end
  end

  describe "attribute methods" do
    it "adds maintenance docs" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_maintenance_docs(1)
        end
      end

      xml = set.to_xml
      expect(xml).to include("Maintenance_Docs")
      expect(xml).to include('attributeId="174"')
    end

    it "adds airworthiness cert" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_airworthiness_cert(1)
        end
      end

      xml = set.to_xml
      expect(xml).to include("Airworthiness_Cert")
      expect(xml).to include('attributeId="35"')
    end
  end
end
