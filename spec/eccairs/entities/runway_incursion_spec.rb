# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Entities::RunwayIncursion do
  describe "class configuration" do
    it "has correct entity_id" do
      expect(described_class.entity_id).to eq("47")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("Runway_Incursion")
    end

    it "inherits from Entity" do
      expect(described_class.superclass).to eq(Eccairs::Base::Entity)
    end
  end

  describe "XML generation" do
    it "generates valid XML within a report" do
      set = Eccairs::Set.new
      set.add_occurrence do |occurrence|
        occurrence.add_file_number("TEST-001")
        occurrence.add_responsible_entity("1")

        occurrence.add_runway_incursion do |incursion|
          incursion.add_entity_involved("1")
        end
      end

      xml = set.to_xml
      expect(xml).to include("Runway_Incursion")
      expect(xml).to include("Entity_Involved")
    end

    it "validates successfully in a minimal report" do
      set = Eccairs::Set.new
      set.add_occurrence do |occurrence|
        occurrence.add_file_number("TEST-001")
        occurrence.add_responsible_entity("1")

        occurrence.add_runway_incursion do |incursion|
          incursion.add_entity_involved("1")
        end
      end

      expect(set.valid?).to be true
    end
  end
end

