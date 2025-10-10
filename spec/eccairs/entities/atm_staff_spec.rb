# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Entities::AtmStaff do
  describe "class configuration" do
    it "has correct entity_id" do
      expect(described_class.entity_id).to eq("9")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("ATM_Staff")
    end

    it "inherits from Entity" do
      expect(described_class.superclass).to eq(Eccairs::Base::Entity)
    end
  end

  describe "XML generation" do
    it "generates valid XML within a report" do
      set = Eccairs::Set.new
      set.add_occurrence do |occurrence|
        occurrence.add_file_number("TEST-001")
        occurrence.add_responsible_entity("1")

        occurrence.add_air_navigation_service do |ans|
          ans.add_sector(id: "SEC1") do |sector|
            sector.add_atm_staff do |staff|
              staff.add_category("1")
              staff.add_duty_time_in_position(8.0)
            end
          end
        end
      end

      xml = set.to_xml
      expect(xml).to include("ATM_Staff")
      expect(xml).to include("Category")
    end

    it "validates successfully in a minimal report" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_air_navigation_service do |ans|
          ans.add_sector(id: "SEC1") do |sector|
            sector.add_atm_staff do |staff|
              staff.add_category("1")
            end
          end
        end
      end

      errors = set.validate
      expect(errors).to be_empty, "Expected no validation errors, got: #{errors.map(&:message).join(", ")}"
    end
  end
end
