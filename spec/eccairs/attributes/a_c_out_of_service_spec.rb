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

    it "inherits from EnumAttribute" do
      expect(described_class.superclass).to eq(Eccairs::Base::EnumAttribute)
    end
  end

  describe "initialization" do
    it "creates an instance with a value" do
      instance = described_class.new("1")
      expect(instance.value).to eq(1)
    end
  end

  describe "XML generation in occurrence" do
    it "generates valid XML within an occurrence" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_a_c_out_of_service("1")
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
          aircraft.add_a_c_out_of_service("1")
        end
      end

      xml = set.to_xml
      expect(xml).to include('<A_C_Out_Of_Service')
      expect(xml).to include('attributeId="650"')
      expect(xml).to include('>1</A_C_Out_Of_Service>')
    end
  end
end
