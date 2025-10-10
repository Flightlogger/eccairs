# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Attributes::TotalCyclesAC do
  describe "class configuration" do
    it "has correct attribute_id" do
      expect(described_class.attribute_id).to eq("33")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("Total_Cycles_A_C")
    end

    it "inherits from IntegerAttribute" do
      expect(described_class.superclass).to eq(Eccairs::Base::IntegerAttribute)
    end
  end

  describe "initialization" do
    it "creates an instance with a value" do
      attribute = described_class.new(15000)
      expect(attribute.value).to eq(15000)
    end
  end

  describe "XML generation in occurrence" do
    it "generates valid XML within an occurrence" do
      set = Eccairs::Set.new
      set.add_occurrence do |occurrence|
        occurrence.add_file_number("TEST-001")
        occurrence.add_responsible_entity("1")

        occurrence.add_aircraft(id: "AC1") do |aircraft|
          aircraft.add_total_cycles_a_c(15000)
        end
      end

      xml = set.to_xml
      expect(xml).to include("Total_Cycles_A_C")
      expect(xml).to include("15000")
    end

    it "validates successfully in a minimal occurrence" do
      set = Eccairs::Set.new
      set.add_occurrence do |occurrence|
        occurrence.add_file_number("TEST-001")
        occurrence.add_responsible_entity("1")

        occurrence.add_aircraft(id: "AC1") do |aircraft|
          aircraft.add_total_cycles_a_c(15000)
        end
      end

      expect(set.valid?).to be true
    end
  end
end
