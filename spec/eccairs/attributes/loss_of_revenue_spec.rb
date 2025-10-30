# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Attributes::LossOfRevenue do
  describe "class configuration" do
    it "has correct attribute_id" do
      expect(described_class.attribute_id).to eq("652")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("Loss_Of_Revenue")
    end

    it "inherits from DecimalAttribute" do
      expect(described_class.superclass).to eq(Eccairs::Base::DecimalAttribute)
    end
  end

  describe "initialization" do
    it "creates an instance with a value" do
      instance = described_class.new(50000.25)
      expect(instance.value).to eq(50000.25)
    end
  end

  describe "XML generation in occurrence" do
    it "generates valid XML within an occurrence" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_loss_of_revenue(50000.25)
        end
      end

      xml = set.to_xml
      expect(xml).to include("Loss_Of_Revenue")
      expect(xml).to include('attributeId="652"')
    end

    it "generates XML with correct structure" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_loss_of_revenue(50000.25)
        end
      end

      xml = set.to_xml
      expect(xml).to include('<Loss_Of_Revenue')
      expect(xml).to include('attributeId="652"')
      expect(xml).to include('>50000.25</Loss_Of_Revenue>')
    end
  end
end
