# frozen_string_literal: true

RSpec.describe Eccairs::Set do
  describe "#validate" do
    it "returns an empty array for valid XML" do
      set = Eccairs.set
      entity = Eccairs::Occurrence::Attributes::DewPoint.new(15.5)
      set.add_entity(entity)

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

    it "validates empty ATTRIBUTES as valid" do
      set = Eccairs.set

      errors = set.validate
      expect(errors).to be_empty
    end
  end

  describe "#valid?" do
    it "returns true for valid XML" do
      set = Eccairs.set
      entity = Eccairs::Occurrence::Attributes::DewPoint.new(15.5)
      set.add_entity(entity)

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

  describe "namespace declarations" do
    it "uses correct namespace URIs" do
      set = Eccairs.set
      entity = Eccairs::Occurrence::Attributes::DewPoint.new(15.5)
      set.add_entity(entity)

      xml = set.to_xml
      expect(xml).to include('xmlns="http://eccairsportal.jrc.ec.europa.eu/ECCAIRS5_dataBridge.xsd"')
      expect(xml).to include('xmlns:dt="http://eccairsportal.jrc.ec.europa.eu/ECCAIRS5_dataTypes.xsd"')
    end

    it "uses correct taxonomy version" do
      set = Eccairs.set
      entity = Eccairs::Occurrence::Attributes::DewPoint.new(15.5)
      set.add_entity(entity)

      xml = set.to_xml
      expect(xml).to include('TaxonomyVersion="5.1.0.0"')
    end

    it "uses correct taxonomy name" do
      set = Eccairs.set
      entity = Eccairs::Occurrence::Attributes::DewPoint.new(15.5)
      set.add_entity(entity)

      xml = set.to_xml
      expect(xml).to include('TaxonomyName="ECCAIRS Aviation"')
    end

    it "uses correct domain" do
      set = Eccairs.set
      entity = Eccairs::Occurrence::Attributes::DewPoint.new(15.5)
      set.add_entity(entity)

      xml = set.to_xml
      expect(xml).to include('Domain="RIT"')
    end

    it "uses correct version" do
      set = Eccairs.set
      entity = Eccairs::Occurrence::Attributes::DewPoint.new(15.5)
      set.add_entity(entity)

      xml = set.to_xml
      expect(xml).to include('Version="1.0.0.0"')
    end
  end
end
