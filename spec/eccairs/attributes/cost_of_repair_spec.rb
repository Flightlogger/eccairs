# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Attributes::CostOfRepair do
  describe "class configuration" do
    it "has correct attribute_id" do
      expect(described_class.attribute_id).to eq("651")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("Cost_Of_Repair")
    end

    it "inherits from DecimalAttribute" do
      expect(described_class.superclass).to eq(Eccairs::Base::DecimalAttribute)
    end
  end

  describe "initialization" do
    it "creates an instance with a value" do
      instance = described_class.new(15000.50)
      expect(instance.value).to eq(15000.50)
    end
  end

  describe "XML generation in occurrence" do
    it "generates valid XML within an occurrence" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_cost_of_repair(15000.50)
        end
      end

      xml = set.to_xml
      expect(xml).to include("Cost_Of_Repair")
      expect(xml).to include('attributeId="651"')
    end

    it "generates XML with correct structure" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_cost_of_repair(15000.50)
        end
      end

      xml = set.to_xml
      expect(xml).to include("<Cost_Of_Repair")
      expect(xml).to include('attributeId="651"')
      expect(xml).to include(">15000.5</Cost_Of_Repair>")
    end
  end
end
