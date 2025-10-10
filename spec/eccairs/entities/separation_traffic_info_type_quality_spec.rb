# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Entities::SeparationTrafficInfoTypeQuality do
  describe "class configuration" do
    it "has correct entity_id" do
      expect(described_class.entity_id).to eq("36")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("Separation_Traffic_Info_Type_Quality")
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

        occurrence.add_separation do |separation|
          separation.add_separation_aircraft do |sep_aircraft|
            sep_aircraft.add_separation_traffic_info_type_quality do |traffic_info|
              traffic_info.add_traffic_info_quality("1")
            end
          end
        end
      end

      xml = set.to_xml
      expect(xml).to include("Separation_Traffic_Info_Type_Quality")
      expect(xml).to include("Traffic_Info_Quality")
    end

    it "validates successfully in a minimal report" do
      set = Eccairs::Set.new
      set.add_occurrence do |occurrence|
        occurrence.add_file_number("TEST-001")
        occurrence.add_responsible_entity("1")

        occurrence.add_separation do |separation|
          separation.add_separation_aircraft do |sep_aircraft|
            sep_aircraft.add_separation_traffic_info_type_quality do |traffic_info|
              traffic_info.add_traffic_info_quality("1")
            end
          end
        end
      end

      expect(set.valid?).to be true
    end
  end
end
