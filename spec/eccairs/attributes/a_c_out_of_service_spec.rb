# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Attributes::ACOutOfService do
  describe "class configuration" do
    it "has correct attribute_id" do
      expect(described_class.attribute_id).to eq("650")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("A_C_Out_Of_Service")
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
      expect(described_class.max).to eq(99999)
    end
  end

  describe "initialization" do
    it "creates an instance with a valid value" do
      instance = described_class.new(10.5)
      expect(instance.value).to eq(10.5)
    end

    it "creates an instance with zero" do
      instance = described_class.new(0)
      expect(instance.value).to eq(0)
    end

    it "creates an instance with max value" do
      instance = described_class.new(99999)
      expect(instance.value).to eq(99999)
    end

    it "raises error for value below minimum" do
      expect { described_class.new(-1) }.to raise_error(ArgumentError, /less than minimum/)
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
          aircraft.add_a_c_out_of_service(24.5)
        end
      end

      xml = set.to_xml
      expect(xml).to include("A_C_Out_Of_Service")
      expect(xml).to include('attributeId="650"')
    end

    it "generates XML with correct structure" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_a_c_out_of_service(48.0)
        end
      end

      xml = set.to_xml
      expect(xml).to include("<A_C_Out_Of_Service")
      expect(xml).to include('attributeId="650"')
      expect(xml).to include(">48.0</A_C_Out_Of_Service>")
    end

    it "generates XML with zero value" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_a_c_out_of_service(0)
        end
      end

      xml = set.to_xml
      expect(xml).to include(">0</A_C_Out_Of_Service>")
    end

    it "generates XML with max value" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_a_c_out_of_service(99999)
        end
      end

      xml = set.to_xml
      expect(xml).to include(">99999</A_C_Out_Of_Service>")
    end
  end
end
