# frozen_string_literal: true

RSpec.describe Eccairs::Report do
  describe "#validate" do
    it "returns an empty array for valid XML" do
      report = Eccairs.report
      occurrence = Eccairs::Occurrence::DewPoint.new(dew_point: 15.5)
      report.add_occurrence(occurrence)

      errors = report.validate
      expect(errors).to be_empty
    end

    it "returns validation errors for invalid XML" do
      # Create a custom occurrence with an invalid Dew_Point value
      class InvalidDewPoint < Eccairs::Occurrence::BaseOccurrence
        def initialize
          super
          add_attribute(:Dew_Point, 150) # Out of range! Should be -100 to 100
        end

        def to_xml(xml)
          xml.Occurrence do
            xml.ATTRIBUTES do
              xml.Dew_Point(@attributes[:Dew_Point], Unit: "C", attributeId: "85")
            end
          end
        end
      end

      report = Eccairs.report
      occurrence = InvalidDewPoint.new
      report.add_occurrence(occurrence)

      errors = report.validate
      expect(errors).not_to be_empty
      expect(errors.first.message).to include("greater than the maximum value allowed")
    end

    it "validates empty ATTRIBUTES as valid" do
      report = Eccairs.report
      occurrence = Eccairs::Occurrence::BaseOccurrence.new
      report.add_occurrence(occurrence)

      errors = report.validate
      expect(errors).to be_empty
    end
  end

  describe "#valid?" do
    it "returns true for valid XML" do
      report = Eccairs.report
      occurrence = Eccairs::Occurrence::DewPoint.new(dew_point: 15.5)
      report.add_occurrence(occurrence)

      expect(report.valid?).to be true
    end

    it "returns false for invalid XML" do
      # Create a custom occurrence with an invalid Dew_Point value
      class InvalidDewPoint2 < Eccairs::Occurrence::BaseOccurrence
        def initialize
          super
          add_attribute(:Dew_Point, -150) # Out of range! Should be -100 to 100
        end

        def to_xml(xml)
          xml.Occurrence do
            xml.ATTRIBUTES do
              xml.Dew_Point(@attributes[:Dew_Point], Unit: "C", attributeId: "85")
            end
          end
        end
      end

      report = Eccairs.report
      occurrence = InvalidDewPoint2.new
      report.add_occurrence(occurrence)

      expect(report.valid?).to be false
    end
  end

  describe "namespace declarations" do
    it "uses correct namespace URIs" do
      report = Eccairs.report
      occurrence = Eccairs::Occurrence::DewPoint.new(dew_point: 15.5)
      report.add_occurrence(occurrence)

      xml = report.to_xml
      expect(xml).to include('xmlns="http://eccairsportal.jrc.ec.europa.eu/ECCAIRS5_dataBridge.xsd"')
      expect(xml).to include('xmlns:dt="http://eccairsportal.jrc.ec.europa.eu/ECCAIRS5_dataTypes.xsd"')
    end

    it "uses correct taxonomy version" do
      report = Eccairs.report
      occurrence = Eccairs::Occurrence::DewPoint.new(dew_point: 15.5)
      report.add_occurrence(occurrence)

      xml = report.to_xml
      expect(xml).to include('TaxonomyVersion="5.1.0.0"')
    end

    it "uses correct taxonomy name" do
      report = Eccairs.report
      occurrence = Eccairs::Occurrence::DewPoint.new(dew_point: 15.5)
      report.add_occurrence(occurrence)

      xml = report.to_xml
      expect(xml).to include('TaxonomyName="ECCAIRS Aviation"')
    end

    it "uses correct domain" do
      report = Eccairs.report
      occurrence = Eccairs::Occurrence::DewPoint.new(dew_point: 15.5)
      report.add_occurrence(occurrence)

      xml = report.to_xml
      expect(xml).to include('Domain="RIT"')
    end

    it "uses correct version" do
      report = Eccairs.report
      occurrence = Eccairs::Occurrence::DewPoint.new(dew_point: 15.5)
      report.add_occurrence(occurrence)

      xml = report.to_xml
      expect(xml).to include('Version="1.0.0.0"')
    end
  end
end
