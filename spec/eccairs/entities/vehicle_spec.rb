# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Entities::Vehicle do
  describe "class configuration" do
    it "has correct entity_id" do
      expect(described_class.entity_id).to eq("48")
    end
    
    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("Vehicle")
    end
    
    it "inherits from Entity" do
      expect(described_class.superclass).to eq(Eccairs::Base::Entity)
    end
    
    it "requires ID attribute" do
            expect(described_class.requires_id?).to be true
          end
  end
  
  describe "XML generation" do
    it "generates valid XML within a report" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
      occurrence.add_aerodrome_general do |aerodrome|
        aerodrome.add_vehicle do |entity|
          # Empty entity
        end
      end
    end
      
      xml = set.to_xml
      expect(xml).to include("Vehicle")
      expect(xml).to include('entityId="48"')
    end
    
    it "validates successfully in a minimal report" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
      occurrence.add_aerodrome_general do |aerodrome|
        aerodrome.add_vehicle do |entity|
          # Empty entity
        end
      end
    end
      
      errors = set.validate
      expect(errors).to be_empty, "Expected no validation errors, got: #{errors.map(&:message).join(', ')}"
    end
  end
end
