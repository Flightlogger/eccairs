# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Attributes::AtaChapterNumber do
  describe "class configuration" do
    it "has correct attribute_id" do
      expect(described_class.attribute_id).to eq("659")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("ATA_Chapter_Number")
    end

    it "inherits from StringAttribute" do
      expect(described_class.superclass).to eq(Eccairs::Base::StringAttribute)
    end
  end
  
  describe "initialization" do
    it "creates an instance with a value" do
      instance = described_class.new("11000000")
      expect(instance.value).to eq("11000000")
    end
  end
  
  describe "XML generation in occurrence" do
    it "generates valid XML within an occurrence" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_part_information do |part|
            part.add_ata_chapter_number("11000000")
          end
        end
      end

      xml = set.to_xml
      expect(xml).to include("ATA_Chapter_Number")
      expect(xml).to include('attributeId="659"')
    end

    it "validates successfully in a minimal occurrence" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_part_information do |part|
            part.add_ata_chapter_number("11000000")
          end
        end
      end

      errors = set.validate
      expect(errors).to be_empty, "Expected no validation errors, got: #{errors.map(&:message).join(', ')}"
    end
  end
end
