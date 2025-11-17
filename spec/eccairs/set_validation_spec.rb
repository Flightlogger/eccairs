# frozen_string_literal: true

RSpec.describe Eccairs::Set do
  describe "#validate" do
    it "returns an empty array for valid XML" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_dew_point(15.5)
      end

      errors = set.validate
      expect(errors).to be_empty
    end

    it "returns validation errors for invalid XML" do
      # Create an entity with an invalid Dew_Point value (out of range -100 to 100)
      # We'll stub the to_xml method to generate invalid XML
      set = Eccairs.set

      # Stub the to_xml method to generate invalid XML
      allow(set).to receive(:to_xml).and_return(<<~XML)
        <?xml version="1.0" encoding="UTF-8"?>
        <SET xmlns="http://eccairsportal.jrc.ec.europa.eu/ECCAIRS5_dataBridge.xsd" xmlns:dt="http://eccairsportal.jrc.ec.europa.eu/ECCAIRS5_dataTypes.xsd" TaxonomyName="ECCAIRS Aviation" TaxonomyVersion="5.1.0.0" Domain="RIT" Version="1.0.0.0">
          <Occurrence entityId="24">
            <ATTRIBUTES>
              <Dew_Point attributeId="85" Unit="C">150</Dew_Point>
            </ATTRIBUTES>
          </Occurrence>
        </SET>
      XML

      errors = set.validate
      expect(errors).not_to be_empty
      expect(errors.first.message).to include("greater than the maximum value allowed")
    end

    it "validates occurrence with empty ATTRIBUTES as valid" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        # Empty occurrence - no attributes
      end

      errors = set.validate
      expect(errors).to be_empty
    end
  end

  describe "#valid?" do
    it "returns true for valid XML" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_dew_point(15.5)
      end

      expect(set.valid?).to be true
    end

    it "returns false for invalid XML" do
      # Create an entity with an invalid Dew_Point value (out of range -100 to 100)
      # We'll stub the to_xml method to generate invalid XML
      set = Eccairs.set

      # Stub the to_xml method to generate invalid XML
      allow(set).to receive(:to_xml).and_return(<<~XML)
        <?xml version="1.0" encoding="UTF-8"?>
        <SET xmlns="http://eccairsportal.jrc.ec.europa.eu/ECCAIRS5_dataBridge.xsd" xmlns:dt="http://eccairsportal.jrc.ec.europa.eu/ECCAIRS5_dataTypes.xsd" TaxonomyName="ECCAIRS Aviation" TaxonomyVersion="5.1.0.0" Domain="RIT" Version="1.0.0.0">
          <Occurrence entityId="24">
            <ATTRIBUTES>
              <Dew_Point attributeId="85" Unit="C">-150</Dew_Point>
            </ATTRIBUTES>
          </Occurrence>
        </SET>
      XML

      expect(set.valid?).to be false
    end
  end

  describe "#validation_errors" do
    it "returns empty array when all attributes are valid" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_dew_point(15.5)
        occurrence.add_air_temperature(25.0)
      end

      expect(set.validation_errors).to be_empty
    end

    it "collects validation errors from invalid attributes" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_dew_point("invalid")
        occurrence.add_air_temperature(25.0)
      end

      errors = set.validation_errors
      expect(errors.length).to eq(1)
      expect(errors.first.field_name).to eq("Dew_Point")
      expect(errors.first.attribute_id).to eq("85")
      expect(errors.first.provided_value).to eq("invalid")
      expect(errors.first.message).to include("must be numeric")
    end

    it "collects multiple validation errors from different attributes" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_dew_point("invalid")
        occurrence.add_air_temperature("also invalid")
        occurrence.add_visibility(5000)
      end

      errors = set.validation_errors
      expect(errors.length).to eq(2)

      field_names = errors.map(&:field_name)
      expect(field_names).to include("Dew_Point", "Air_Temperature")
    end

    it "collects errors from nested entities" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_aircraft do |aircraft|
          aircraft.add_aircraft_total_time("invalid")
        end
      end

      errors = set.validation_errors
      expect(errors.length).to eq(1)
      expect(errors.first.field_name).to eq("Aircraft_Total_Time")
    end

    it "collects errors from multiple occurrences" do
      set = Eccairs.set

      set.add_occurrence do |occurrence|
        occurrence.add_dew_point("invalid1")
      end

      set.add_occurrence do |occurrence|
        occurrence.add_air_temperature("invalid2")
      end

      errors = set.validation_errors
      expect(errors.length).to eq(2)
    end
  end

  describe "#validation_summary" do
    it "groups errors by field name" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_dew_point("invalid")
        occurrence.add_air_temperature("also invalid")
      end

      summary = set.validation_summary
      expect(summary.keys).to include("Dew_Point", "Air_Temperature")
      expect(summary["Dew_Point"]).to be_an(Array)
      expect(summary["Dew_Point"].first[:value]).to eq("invalid")
      expect(summary["Dew_Point"].first[:message]).to include("must be numeric")
    end

    it "returns empty hash when no errors" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_dew_point(15.5)
      end

      summary = set.validation_summary
      expect(summary).to be_empty
    end
  end

  describe "#invalid_fields" do
    it "returns list of field names with errors" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_dew_point("invalid")
        occurrence.add_air_temperature("also invalid")
        occurrence.add_visibility(5000)
      end

      invalid = set.invalid_fields
      expect(invalid).to contain_exactly("Dew_Point", "Air_Temperature")
    end

    it "returns empty array when no errors" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_dew_point(15.5)
      end

      invalid = set.invalid_fields
      expect(invalid).to be_empty
    end
  end

  describe "error collection behavior" do
    it "allows report generation even with invalid fields" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_dew_point("invalid")
        occurrence.add_air_temperature(25.0)
      end

      # Should not raise an error
      xml = set.to_xml
      expect(xml).to be_a(String)
      expect(xml).to include("Air_Temperature")
      # Invalid field should still appear in XML with nil value (not included)
      # The attribute is created but has no valid value, so it won't be in XML
      expect(xml).not_to include("attributeId=\"85\"")
    end

    it "tracks errors across value reassignment" do
      set = Eccairs.set
      occurrence = nil

      set.add_occurrence do |occ|
        occurrence = occ
        occurrence.add_dew_point(15.5)
      end

      expect(set.validation_errors).to be_empty

      # Reassign to invalid value
      occurrence.instance_variable_get(:@attributes)[:dew_point].first.value = "invalid"

      errors = set.validation_errors
      expect(errors.length).to eq(1)
      expect(errors.first.field_name).to eq("Dew_Point")
    end
  end

  describe "namespace declarations" do
    it "uses correct namespace URIs" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_dew_point(15.5)
      end

      xml = set.to_xml
      expect(xml).to include('xmlns="http://eccairsportal.jrc.ec.europa.eu/ECCAIRS5_dataBridge.xsd"')
      expect(xml).to include('xmlns:dt="http://eccairsportal.jrc.ec.europa.eu/ECCAIRS5_dataTypes.xsd"')
    end

    it "uses correct taxonomy version" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_dew_point(15.5)
      end

      xml = set.to_xml
      expect(xml).to include('TaxonomyVersion="5.1.0.0"')
    end

    it "uses correct taxonomy name" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_dew_point(15.5)
      end

      xml = set.to_xml
      expect(xml).to include('TaxonomyName="ECCAIRS Aviation"')
    end

    it "uses correct domain" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_dew_point(15.5)
      end

      xml = set.to_xml
      expect(xml).to include('Domain="RIT"')
    end

    it "uses correct version" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_dew_point(15.5)
      end

      xml = set.to_xml
      expect(xml).to include('Version="1.0.0.0"')
    end
  end
end
