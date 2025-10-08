# frozen_string_literal: true

require "nokogiri"

RSpec.describe Eccairs::Occurrence::Entities::BaseEntity do
  describe ".attribute_id" do
    it "can set and retrieve attribute_id" do
      test_class = Class.new(described_class) do
        attribute_id 123
      end

      expect(test_class.attribute_id).to eq("123")
    end

    it "returns nil when attribute_id is not set" do
      test_class = Class.new(described_class)
      expect(test_class.attribute_id).to be_nil
    end
  end

  describe "#validate_numeric!" do
    let(:entity) { described_class.new }

    it "accepts valid numeric values" do
      expect {
        entity.send(:validate_numeric!, :test, 50, min: 0, max: 100)
      }.not_to raise_error
    end

    it "accepts nil values" do
      expect {
        entity.send(:validate_numeric!, :test, nil, min: 0, max: 100)
      }.not_to raise_error
    end

    it "raises error for non-numeric values" do
      expect {
        entity.send(:validate_numeric!, :test, "not a number", min: 0, max: 100)
      }.to raise_error(Eccairs::ValidationError, /must be a number/)
    end

    it "raises error for values below minimum" do
      expect {
        entity.send(:validate_numeric!, :test, -10, min: 0, max: 100)
      }.to raise_error(Eccairs::ValidationError, /greater than or equal to 0/)
    end

    it "raises error for values above maximum" do
      expect {
        entity.send(:validate_numeric!, :test, 150, min: 0, max: 100)
      }.to raise_error(Eccairs::ValidationError, /less than or equal to 100/)
    end
  end

  describe "#validate_enum!" do
    let(:entity) { described_class.new }

    it "accepts valid enum values" do
      expect {
        entity.send(:validate_enum!, :test, "1", allowed_values: ["1", "2", "3"])
      }.not_to raise_error
    end

    it "accepts nil values" do
      expect {
        entity.send(:validate_enum!, :test, nil, allowed_values: ["1", "2", "3"])
      }.not_to raise_error
    end

    it "raises error for invalid enum values" do
      expect {
        entity.send(:validate_enum!, :test, "4", allowed_values: ["1", "2", "3"])
      }.to raise_error(Eccairs::ValidationError, /must be one of: 1, 2, 3/)
    end
  end

  describe "#build_xml" do
    it "raises NotImplementedError" do
      entity = described_class.new
      expect {
        entity.build_xml(nil)
      }.to raise_error(NotImplementedError, /must implement build_xml/)
    end
  end
end

