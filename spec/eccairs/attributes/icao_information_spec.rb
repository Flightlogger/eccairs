# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Attributes::IcaoInformation do
  describe "class configuration" do
    it "has correct attribute_id" do
      expect(described_class.attribute_id).to eq("28")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("ICAO_Information")
    end

    it "inherits from StringAttribute" do
      expect(described_class.superclass).to eq(Eccairs::Base::StringAttribute)
    end
  end

  describe "initialization" do
    it "creates an instance with a value" do
      instance = described_class.new("ICAO Annex 13 information")
      expect(instance.value).to eq("ICAO Annex 13 information")
    end
  end

  describe "XML generation in occurrence" do
    it "generates valid XML within an occurrence" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_icao_information("ICAO Annex 13 information")
        end
      end

      xml = set.to_xml
      expect(xml).to include("ICAO_Information")
      expect(xml).to include('attributeId="28"')
    end

    it "generates XML with correct structure" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_icao_information("ICAO Annex 13 information")
        end
      end

      xml = set.to_xml
      expect(xml).to include('<ICAO_Information')
      expect(xml).to include('attributeId="28"')
      expect(xml).to include('>ICAO Annex 13 information</ICAO_Information>')
    end
  end
end
