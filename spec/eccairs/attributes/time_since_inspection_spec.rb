# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Attributes::TimeSinceInspection do
  describe "class configuration" do
    it "has correct attribute_id" do
      expect(described_class.attribute_id).to eq("901")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("Time_Since_Inspection")
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
          aircraft.add_propeller do |prop|
            prop.add_time_since_inspection(10.5)
          end
        end
      end

      xml = set.to_xml
      expect(xml).to include("Time_Since_Inspection")
      expect(xml).to include('attributeId="901"')
    end

    it "validates successfully in a minimal occurrence" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_propeller do |prop|
            prop.add_time_since_inspection(10.5)
          end
        end
      end

      errors = set.validate
      expect(errors).to be_empty, "Expected no validation errors, got: #{errors.map(&:message).join(', ')}"
    end
  end
end
