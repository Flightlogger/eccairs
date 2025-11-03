# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Entities::PartInformation do
  describe "class configuration" do
    it "has correct entity_id" do
      expect(described_class.entity_id).to eq("26")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("Part_Information")
    end

    it "inherits from Entity" do
      expect(described_class.superclass).to eq(Eccairs::Base::Entity)
    end
  end

  describe "XML generation" do
    it "generates valid XML within a report" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_part_information do |entity|
            # Empty entity
          end
        end
      end

      xml = set.to_xml
      expect(xml).to include("Part_Information")
      expect(xml).to include('entityId="26"')
    end

    it "validates successfully in a minimal report" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_part_information do |entity|
            # Empty entity
          end
        end
      end

      errors = set.validate
      expect(errors).to be_empty, "Expected no validation errors, got: #{errors.map(&:message).join(", ")}"
    end
  end

  describe "attribute methods" do
    it "adds time since inspection (using TimeSinceInspection)" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_part_information do |part_info|
            part_info.add_time_since_inspection(10.5)
          end
        end
      end

      xml = set.to_xml
      expect(xml).to include("Time_Since_Inspection")
      expect(xml).to include('attributeId="901"')
    end

    it "adds part information time since inspection (attribute ID 662)" do
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
  end
end
