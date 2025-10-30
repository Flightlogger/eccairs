# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Attributes::AircraftManufacturerModel do
  describe "class configuration" do
    it "has correct attribute_id" do
      expect(described_class.attribute_id).to eq("21")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("Manufacturer_Model")
    end

    it "inherits from StringAttribute" do
      expect(described_class.superclass).to eq(Eccairs::Base::StringAttribute)
    end
  end

  describe "initialization" do
    it "creates an instance with a value" do
      instance = described_class.new("Boeing 737-800")
      expect(instance.value).to eq("Boeing 737-800")
    end
  end

  describe "XML generation in occurrence" do
    it "generates valid XML within an occurrence" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_manufacturer_model("Boeing 737-800")
        end
      end

      xml = set.to_xml
      expect(xml).to include("Manufacturer_Model")
      expect(xml).to include('attributeId="21"')
    end

    it "generates XML with correct structure" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_manufacturer_model("Boeing 737-800")
        end
      end

      xml = set.to_xml
      expect(xml).to include("<Manufacturer_Model")
      expect(xml).to include('attributeId="21"')
      expect(xml).to include(">Boeing 737-800</Manufacturer_Model>")
    end
  end
end
