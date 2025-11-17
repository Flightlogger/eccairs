# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Attributes::EngineTimeSinceOverhaul do
  describe "class configuration" do
    it "has correct attribute_id" do
      expect(described_class.attribute_id).to eq("389")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("Time_Since_Overhaul")
    end

    it "inherits from DecimalAttribute" do
      expect(described_class.superclass).to eq(Eccairs::Base::DecimalAttribute)
    end

    it "has correct unit" do
      expect(described_class.unit).to eq("Hour(s)")
    end

    it "has correct min value" do
      expect(described_class.min).to eq(0)
    end

    it "has correct max value" do
      expect(described_class.max).to eq(999999)
    end
  end

  describe "initialization" do
    it "creates an instance with a decimal value" do
      instance = described_class.new(200.5)
      expect(instance.value).to eq(200.5)
    end

    it "creates an instance with an integer value" do
      instance = described_class.new(200)
      expect(instance.value).to eq(200)
    end

    it "accepts zero value" do
      instance = described_class.new(0)
      expect(instance.value).to eq(0)
    end

    it "rejects negative value" do
      instance = described_class.new(-1)
      expect(instance.valid?).to be false
      expect(instance.validation_error.message).to match(/less than minimum/)
    end

    it "rejects value exceeding maximum" do
      instance = described_class.new(1000000)
      expect(instance.valid?).to be false
      expect(instance.validation_error.message).to match(/greater than maximum/)
    end
  end

  describe "XML generation in engine" do
    it "generates valid XML within an engine" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_engine do |engine|
            engine.add_time_since_overhaul(200.5)
          end
        end
      end

      xml = set.to_xml
      expect(xml).to include("Time_Since_Overhaul")
      expect(xml).to include('attributeId="389"')
      expect(xml).to include('Unit="Hour(s)"')
    end

    it "validates successfully in a minimal occurrence" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_engine do |engine|
            engine.add_time_since_overhaul(200.5)
          end
        end
      end

      errors = set.validate
      expect(errors).to be_empty, "Expected no validation errors, got: #{errors.map(&:message).join(", ")}"
    end
  end
end
