# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Attributes::IcaoInformation do
  describe "class configuration" do
    it "has correct attribute_id from icao_information.yml" do
      expect(described_class.attribute_id).to eq("28")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("ICAO_Information")
    end

    it "inherits from EnumAttribute" do
      expect(described_class.superclass).to eq(Eccairs::Base::EnumAttribute)
    end

    it "loads allowed values from icao_information.yml" do
      expect(described_class.allowed_values).to include(1, 2, 3, 97, 99)
    end
  end

  describe "initialization" do
    it "accepts a valid integer id" do
      instance = described_class.new(99)
      expect(instance.value).to eq(99)
    end

    it "accepts a valid numeric string" do
      instance = described_class.new("99")
      expect(instance.value).to eq(99)
    end

    it "rejects values not in the taxonomy" do
      expect { described_class.new("not-a-code") }.to raise_error(ArgumentError, /allowed enum value/)
    end
  end

  describe "XML generation in occurrence" do
    it "generates valid XML when given an integer enum id" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_icao_information(99)
        end
      end

      xml = set.to_xml
      expect(xml).to include("ICAO_Information")
      expect(xml).to include('attributeId="28"')
      expect(xml).to include("99")
    end

    it "accepts digits-only string enum id (same as other enum add_* callers)" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_icao_information("99")
        end
      end

      xml = set.to_xml
      expect(xml).to include("99")
    end
  end
end
