# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Attributes::VisibRestrictions do
  describe "class configuration" do
    it "has correct attribute_id" do
      expect(described_class.attribute_id).to eq("311")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("Visib_Restrictions")
    end

    it "inherits from EnumAttribute" do
      expect(described_class.superclass).to eq(Eccairs::Base::EnumAttribute)
    end
  end

  describe "initialization" do
    it "creates an instance with a value" do
      attribute = described_class.new("4")
      expect(attribute.value).to eq("4")
    end
  end

  describe "XML generation in occurrence" do
    it "generates valid XML within an occurrence" do
      set = Eccairs::Set.new
      set.add_occurrence do |occurrence|
        occurrence.add_file_number("TEST-001")
        occurrence.add_responsible_entity("1")

        occurrence.add_aircraft(id: "AC1") do |aircraft|
          aircraft.add_visib_restrictions("4")
        end
      end

      xml = set.to_xml
      expect(xml).to include("Visib_Restrictions")
      expect(xml).to include("4")
    end

    it "validates successfully in a minimal occurrence" do
      set = Eccairs::Set.new
      set.add_occurrence do |occurrence|
        occurrence.add_file_number("TEST-001")
        occurrence.add_responsible_entity("1")

        occurrence.add_aircraft(id: "AC1") do |aircraft|
          aircraft.add_visib_restrictions("4")
        end
      end

      expect(set.valid?).to be true
    end
  end
end
