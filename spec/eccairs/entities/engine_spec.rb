# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Entities::Engine do
  describe "class configuration" do
    it "has correct entity_id" do
      expect(described_class.entity_id).to eq("13")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("Engine")
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
          aircraft.add_engine do |entity|
            # Empty entity
          end
        end
      end

      xml = set.to_xml
      expect(xml).to include("Engine")
      expect(xml).to include('entityId="13"')
    end

    it "validates successfully in a minimal report" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_engine do |entity|
            # Empty entity
          end
        end
      end

      errors = set.validate
      expect(errors).to be_empty, "Expected no validation errors, got: #{errors.map(&:message).join(", ")}"
    end
  end

  describe "attribute methods" do
    it "adds time since inspection (using EngineTimeSinceInspection)" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_engine do |engine|
            engine.add_time_since_inspection(10.5)
          end
        end
      end

      xml = set.to_xml
      expect(xml).to include("Time_Since_Inspection")
      expect(xml).to include('attributeId="901"')
    end

    it "adds engine time since inspection (attribute ID 884)" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_engine do |engine|
            engine.add_engine_time_since_inspection(100.5)
          end
        end
      end

      xml = set.to_xml
      expect(xml).to include("Time_Since_Inspection")
      expect(xml).to include('attributeId="884"')
      expect(xml).to include('Unit="Hour(s)"')
    end

    it "adds time since overhaul (attribute ID 389)" do
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
  end
end
