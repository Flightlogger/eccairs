# frozen_string_literal: true

RSpec.shared_examples "an attribute with nil value handling" do
  it "accepts nil value" do
    instance = test_class.new(nil)
    expect(instance.value).to be_nil
  end

  it "does not validate nil" do
    expect { test_class.new(nil) }.not_to raise_error
  end
end

RSpec.shared_examples "an attribute with value assignment" do |valid_value, invalid_value, error_pattern|
  it "validates on value assignment" do
    instance = test_class.new(valid_value)
    instance.value = invalid_value
    expect(instance.valid?).to be false
    expect(instance.validation_error.message).to match(error_pattern)
  end

  it "allows changing to another valid value" do |example|
    # Get the alternate valid value from metadata or use a default
    alternate_value = example.metadata[:alternate_valid_value] || valid_value
    instance = test_class.new(valid_value)
    instance.value = alternate_value
    expect(instance.value).to eq(alternate_value)
  end
end

RSpec.shared_examples "an attribute that rejects invalid types" do |invalid_types|
  invalid_types.each do |type_name, value, error_pattern|
    it "rejects #{type_name}" do
      instance = test_class.new(value)
      expect(instance.valid?).to be false
      expect(instance.validation_error.message).to match(error_pattern)
    end
  end
end

RSpec.shared_examples "an attribute with XML generation" do |valid_value, xml_tag, attribute_id|
  it "generates XML with value" do
    xml_builder = Nokogiri::XML::Builder.new
    instance = test_class.new(valid_value)
    instance.build_xml(xml_builder)

    xml = xml_builder.to_xml
    expect(xml).to include(xml_tag)
    expect(xml).to include('attributeId="' + attribute_id + '"')
  end

  it "does not generate XML for nil value" do
    xml_builder = Nokogiri::XML::Builder.new
    instance = test_class.new(nil)
    instance.build_xml(xml_builder)

    xml = xml_builder.to_xml
    expect(xml).not_to include(xml_tag)
  end
end
