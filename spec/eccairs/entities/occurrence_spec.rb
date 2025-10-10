# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Entities::Occurrence do
  describe "class configuration" do
    it "has correct entity_id" do
      expect(described_class.entity_id).to eq("24")
    end
    
    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("Occurrence")
    end
    
    it "inherits from Entity" do
      expect(described_class.superclass).to eq(Eccairs::Base::Entity)
    end
  end
  
  describe "XML generation" do
    it "generates valid XML" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        # Empty occurrence
      end
      
      xml = set.to_xml
      expect(xml).to include("Occurrence")
      expect(xml).to include('entityId="24"')
    end
    
    it "validates successfully" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        # Empty occurrence
      end
      
      errors = set.validate
      expect(errors).to be_empty, "Expected no validation errors, got: #{errors.map(&:message).join(', ')}"
    end
  end
end
