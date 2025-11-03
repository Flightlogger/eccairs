# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Attributes::PartInformationTimeSinceInspection do
  describe "class configuration" do
    it "has correct attribute_id" do
      expect(described_class.attribute_id).to eq("662")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("Time_Since_Inspection")
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
      instance = described_class.new(50.5)
      expect(instance.value).to eq(50.5)
    end

    it "creates an instance with an integer value" do
      instance = described_class.new(50)
      expect(instance.value).to eq(50)
    end

    it "accepts zero value" do
      instance = described_class.new(0)
      expect(instance.value).to eq(0)
    end

    it "rejects negative value" do
      expect { described_class.new(-1) }.to raise_error(ArgumentError, /less than minimum/)
    end

    it "rejects value exceeding maximum" do
      expect { described_class.new(1000000) }.to raise_error(ArgumentError, /greater than maximum/)
    end
  end

  describe "XML generation in part information" do
    it "generates valid XML within part information" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_part_information do |part_info|
            part_info.add_part_information_time_since_inspection(50.5)
          end
        end
      end

      xml = set.to_xml
      expect(xml).to include("Time_Since_Inspection")
      expect(xml).to include('attributeId="662"')
      expect(xml).to include('Unit="Hour(s)"')
    end

    it "validates successfully in a minimal occurrence" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_part_information do |part_info|
            part_info.add_part_information_time_since_inspection(50.5)
          end
        end
      end

      errors = set.validate
      expect(errors).to be_empty, "Expected no validation errors, got: #{errors.map(&:message).join(", ")}"
    end
  end
end
