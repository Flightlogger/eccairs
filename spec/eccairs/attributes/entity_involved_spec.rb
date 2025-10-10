# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Attributes::EntityInvolved do
  describe "class configuration" do
    it "has correct attribute_id" do
      expect(described_class.attribute_id).to eq("741")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("Entity_Involved")
    end

    it "inherits from StringAttribute" do
      expect(described_class.superclass).to eq(Eccairs::Base::StringAttribute)
    end
  end

  describe "initialization" do
    it "creates an instance with a value" do
      attribute = described_class.new("1")
      expect(attribute.value).to eq("1")
    end
  end

  describe "XML generation in occurrence" do
    it "generates valid XML within an occurrence" do
      set = Eccairs::Set.new
      set.add_occurrence do |occurrence|
        occurrence.add_file_number("TEST-001")
        occurrence.add_responsible_entity("1")

        occurrence.add_runway_incursion do |incursion|
          incursion.add_entity_involved("1")
        end
      end

      xml = set.to_xml
      expect(xml).to include("Entity_Involved")
      expect(xml).to include("1")
    end

    it "validates successfully in a minimal occurrence" do
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
