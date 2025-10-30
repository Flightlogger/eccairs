# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Attributes::SpeedAtImpact do
  describe "class configuration" do
    it "has correct attribute_id" do
      expect(described_class.attribute_id).to eq("272")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("Speed_At_Impact")
    end

    it "inherits from DecimalAttribute" do
      expect(described_class.superclass).to eq(Eccairs::Base::DecimalAttribute)
    end
  end

  describe "initialization" do
    it "creates an instance with a value" do
      instance = described_class.new(10.5)
      expect(instance.value).to eq(10.5)
    end
  end

  describe "XML generation in occurrence" do
    it "generates valid XML within an occurrence" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_speed_at_impact(10.5)
        end
      end

      xml = set.to_xml
      expect(xml).to include("Speed_At_Impact")
      expect(xml).to include('attributeId="272"')
    end

    it "generates XML with correct structure" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_speed_at_impact(10.5)
        end
      end

      xml = set.to_xml
      expect(xml).to include('<Speed_At_Impact')
      expect(xml).to include('attributeId="272"')
      expect(xml).to include('>10.5</Speed_At_Impact>')
    end
  end
end
