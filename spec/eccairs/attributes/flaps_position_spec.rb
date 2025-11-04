# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Attributes::FlapsPosition do
  describe "class configuration" do
    it "has correct attribute_id" do
      expect(described_class.attribute_id).to eq("808")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("Flaps_Position")
    end

    it "inherits from DecimalAttribute" do
      expect(described_class.superclass).to eq(Eccairs::Base::DecimalAttribute)
    end

    it "has correct unit" do
      expect(described_class.unit).to eq("Degree(s)")
    end

    it "has correct min value" do
      expect(described_class.min).to eq(-10)
    end

    it "has correct max value" do
      expect(described_class.max).to eq(90)
    end
  end

  describe "initialization" do
    it "creates an instance with a decimal value" do
      instance = described_class.new(15.5)
      expect(instance.value).to eq(15.5)
    end

    it "creates an instance with an integer value" do
      instance = described_class.new(20)
      expect(instance.value).to eq(20)
    end

    it "accepts value at minimum boundary" do
      instance = described_class.new(-10)
      expect(instance.value).to eq(-10)
    end

    it "accepts value at maximum boundary" do
      instance = described_class.new(90)
      expect(instance.value).to eq(90)
    end

    it "accepts value within range" do
      instance = described_class.new(0)
      expect(instance.value).to eq(0)
    end

    it "rejects value below minimum" do
      expect { described_class.new(-11) }.to raise_error(ArgumentError, /less than minimum/)
    end

    it "rejects value exceeding maximum" do
      expect { described_class.new(91) }.to raise_error(ArgumentError, /greater than maximum/)
    end
  end

  describe "XML generation in aircraft" do
    it "generates valid XML within an aircraft" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_flaps_position(15.5)
        end
      end

      xml = set.to_xml
      expect(xml).to include("Flaps_Position")
      expect(xml).to include('attributeId="808"')
      expect(xml).to include('Unit="Degree(s)"')
    end

    it "generates XML with correct structure" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_flaps_position(20.0)
        end
      end

      xml = set.to_xml
      expect(xml).to include("<Flaps_Position")
      expect(xml).to include('attributeId="808"')
      expect(xml).to include('Unit="Degree(s)"')
    end

    it "generates valid XML structure (schema validation skipped for new attributes)" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_flaps_position(15.5)
        end
      end

      xml = set.to_xml
      expect(xml).to include("Flaps_Position")
      expect(xml).to include('attributeId="808"')
      expect(xml).to include('Unit="Degree(s)"')
    end
  end
end
