# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Entities::AerodromeWeatherReports do
  describe "class configuration" do
    it "has correct entity_id" do
      expect(described_class.entity_id).to eq("2")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("Aerodrome_Weather_Reports")
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

        occurrence.add_aerodrome_weather_reports do |weather|
          weather.add_wx_report("METAR EGLL 121350Z 27015KT 9999 FEW035 09/03 Q1023")
        end
      end

      xml = set.to_xml
      expect(xml).to include("Aerodrome_Weather_Reports")
      expect(xml).to include("Wx_Report")
    end

    it "validates successfully in a minimal report" do
      set = Eccairs::Set.new
      set.add_occurrence do |occurrence|
        occurrence.add_file_number("TEST-001")
        occurrence.add_responsible_entity("1")

        occurrence.add_aerodrome_weather_reports do |weather|
          weather.add_wx_report("METAR EGLL 121350Z 27015KT 9999 FEW035 09/03 Q1023")
        end
      end

      expect(set.valid?).to be true
    end
  end
end

