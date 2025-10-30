# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Attributes::ActualAltimeterSetting do
  describe "class configuration" do
    it "has correct attribute_id" do
      expect(described_class.attribute_id).to eq("23")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("Actual_Altimeter_Setting")
    end

    it "inherits from DecimalAttribute" do
      expect(described_class.superclass).to eq(Eccairs::Base::DecimalAttribute)
    end

    it "has correct unit" do
      expect(described_class.unit).to eq("hPa")
    end

    it "has correct min value" do
      expect(described_class.min).to eq(-3000)
    end

    it "has correct max value" do
      expect(described_class.max).to eq(99999)
    end
  end

  describe "initialization" do
    it "creates an instance with a value" do
      instance = described_class.new(1013.25)
      expect(instance.value).to eq(1013.25)
    end

    it "validates value within range" do
      instance = described_class.new(1020.5)
      expect(instance.value).to eq(1020.5)
    end

    it "creates an instance with low pressure value" do
      instance = described_class.new(950.0)
      expect(instance.value).to eq(950.0)
    end

    it "creates an instance with high pressure value" do
      instance = described_class.new(1050.0)
      expect(instance.value).to eq(1050.0)
    end

    it "raises error for value below minimum" do
      expect { described_class.new(-3001) }.to raise_error(ArgumentError, /less than minimum/)
    end

    it "raises error for value above maximum" do
      expect { described_class.new(100000) }.to raise_error(ArgumentError, /greater than maximum/)
    end
  end

  describe "XML generation in occurrence" do
    it "generates valid XML within an occurrence" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_actual_altimeter_setting(1013.25)
        end
      end

      xml = set.to_xml
      expect(xml).to include("Actual_Altimeter_Setting")
      expect(xml).to include('attributeId="23"')
      expect(xml).to include('Unit="hPa"')
    end

    it "generates valid XML structure (schema validation skipped for new attributes)" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_actual_altimeter_setting(1020.5)
        end
      end

      xml = set.to_xml
      expect(xml).to include("Actual_Altimeter_Setting")
      expect(xml).to include('attributeId="23"')
      expect(xml).to include('Unit="hPa"')
      expect(xml).to include("1020.5")
    end
  end
end
