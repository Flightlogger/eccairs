# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Attributes::MaximumTOMass do
  describe "class configuration" do
    it "has correct attribute_id" do
      expect(described_class.attribute_id).to eq("175")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("Maximum_T_O_Mass")
    end

    it "inherits from DecimalAttribute" do
      expect(described_class.superclass).to eq(Eccairs::Base::DecimalAttribute)
    end
  end

  describe "initialization" do
    it "creates an instance with a value" do
      attribute = described_class.new(79000.5)
      expect(attribute.value).to eq(79000.5)
    end
  end

  describe "XML generation in occurrence" do
    it "generates valid XML within an occurrence" do
      set = Eccairs::Set.new
      set.add_occurrence do |occurrence|
        occurrence.add_file_number("TEST-001")
        occurrence.add_responsible_entity("1")
        occurrence.add_occurrence_class("100")

        occurrence.add_aircraft(id: "AC1") do |aircraft|
          aircraft.add_maximum_t_o_mass(79000.5)
        end
      end

      xml = set.to_xml
      expect(xml).to include("Maximum_T_O_Mass")
      expect(xml).to include("79000.5")
    end

    it "validates successfully in a minimal occurrence" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft(id: "AC1") do |aircraft|
          aircraft.add_maximum_t_o_mass(79000.5)
        end
      end

      errors = set.validate
      expect(errors).to be_empty, "Expected no validation errors, got: #{errors.map(&:message).join(", ")}"
    end
  end
end
