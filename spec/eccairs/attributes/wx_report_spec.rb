# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Attributes::WxReport do
  describe "class configuration" do
    it "has correct attribute_id" do
      expect(described_class.attribute_id).to eq("177")
    end

    it "has correct xml_tag" do
      expect(described_class.xml_tag).to eq("Wx_Report")
    end

    it "inherits from TextAttribute" do
      expect(described_class.superclass).to eq(Eccairs::Base::TextAttribute)
    end
  end

  describe "initialization" do
    it "creates an instance with a value" do
      attribute = described_class.new("METAR EGLL 121350Z 27015KT 9999 FEW035 09/03 Q1023")
      expect(attribute.value).to eq("METAR EGLL 121350Z 27015KT 9999 FEW035 09/03 Q1023")
    end
  end

  describe "XML generation in occurrence" do
    it "generates valid XML within an occurrence" do
      set = Eccairs::Set.new
      set.add_occurrence do |occurrence|
        occurrence.add_file_number("TEST-001")
        occurrence.add_responsible_entity("1")

        occurrence.add_aerodrome_weather_reports do |weather|
          weather.add_wx_report("METAR EGLL 121350Z 27015KT 9999 FEW035 09/03 Q1023")
        end
      end

      xml = set.to_xml
      expect(xml).to include("Wx_Report")
      expect(xml).to include("METAR EGLL 121350Z 27015KT 9999 FEW035 09/03 Q1023")
    end

    it "validates successfully in a minimal occurrence" do
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
