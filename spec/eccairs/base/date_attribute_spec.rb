# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Base::DateAttribute do
  let(:test_date_class) do
    Class.new(described_class) do
      attribute_id "999"
      xml_tag "Test_Date"
    end
  end

  describe "validation" do
    describe "with Date objects" do
      it "accepts Date object" do
        date = Date.new(2024, 1, 15)
        instance = test_date_class.new(date)
        expect(instance.value).to eq("2024-01-15")
      end

      it "converts Date to ISO 8601 format" do
        date = Date.new(2024, 12, 31)
        instance = test_date_class.new(date)
        expect(instance.value).to eq("2024-12-31")
      end

      it "handles leap year dates" do
        date = Date.new(2024, 2, 29)
        instance = test_date_class.new(date)
        expect(instance.value).to eq("2024-02-29")
      end
    end

    describe "with string values" do
      it "accepts valid ISO 8601 date string" do
        instance = test_date_class.new("2024-01-15")
        expect(instance.value).to eq("2024-01-15")
      end

      it "accepts date with leading zeros" do
        instance = test_date_class.new("2024-01-01")
        expect(instance.value).to eq("2024-01-01")
      end

      it "accepts date at year boundaries" do
        instance = test_date_class.new("2024-12-31")
        expect(instance.value).to eq("2024-12-31")
      end

      it "rejects invalid date format" do
        instance = test_date_class.new("01/15/2024")
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/Date must be in YYYY-MM-DD format/)
      end

      it "rejects date with wrong separator" do
        instance = test_date_class.new("2024/01/15")
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/Date must be in YYYY-MM-DD format/)
      end

      it "rejects date without separators" do
        instance = test_date_class.new("20240115")
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/Date must be in YYYY-MM-DD format/)
      end

      it "rejects invalid month" do
        instance = test_date_class.new("2024-13-01")
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/Invalid date format/)
      end

      it "rejects invalid day" do
        instance = test_date_class.new("2024-01-32")
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/Invalid date format/)
      end

      it "rejects February 30th" do
        instance = test_date_class.new("2024-02-30")
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/Invalid date format/)
      end

      it "rejects February 29th in non-leap year" do
        instance = test_date_class.new("2023-02-29")
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/Invalid date format/)
      end

      it "rejects incomplete date" do
        instance = test_date_class.new("2024-01")
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/Date must be in YYYY-MM-DD format/)
      end

      it "accepts date with time component and extracts date" do
        instance = test_date_class.new("2024-01-15T10:30:00")
        expect(instance.value).to eq("2024-01-15")
      end

      it "accepts datetime string with timezone and extracts date" do
        instance = test_date_class.new("2024-01-15T10:30:00Z")
        expect(instance.value).to eq("2024-01-15")
      end

      it "accepts datetime string with offset and extracts date" do
        instance = test_date_class.new("2024-01-15T10:30:00+01:00")
        expect(instance.value).to eq("2024-01-15")
      end
    end

    describe "with Time and DateTime objects" do
      it "accepts Time object and extracts date" do
        time = Time.new(2024, 1, 15, 10, 30, 0)
        instance = test_date_class.new(time)
        expect(instance.value).to eq("2024-01-15")
      end

      it "accepts DateTime object and extracts date" do
        datetime = DateTime.new(2024, 1, 15, 10, 30, 0)
        instance = test_date_class.new(datetime)
        expect(instance.value).to eq("2024-01-15")
      end
    end

    describe "with invalid types" do
      let(:test_class) { test_date_class }

      include_examples "an attribute that rejects invalid types", [
        ["integer", 20240115, /must be a Date, Time, DateTime, or ISO 8601 date string/],
        ["float", 2024.0115, /must be a Date, Time, DateTime, or ISO 8601 date string/],
        ["array", [2024, 1, 15], /must be a Date, Time, DateTime, or ISO 8601 date string/],
        ["hash", {year: 2024, month: 1, day: 15}, /must be a Date, Time, DateTime, or ISO 8601 date string/]
      ]
    end

    describe "with nil value" do
      let(:test_class) { test_date_class }

      include_examples "an attribute with nil value handling"
    end

    describe "value assignment" do
      let(:test_class) { test_date_class }

      include_examples "an attribute with value assignment",
        "2024-01-15",
        "invalid",
        /Date must be in YYYY-MM-DD format/

      it "allows changing to another valid value", alternate_valid_value: "2024-12-31" do
        instance = test_date_class.new("2024-01-15")
        instance.value = "2024-12-31"
        expect(instance.value).to eq("2024-12-31")
      end
    end
  end

  describe "XML generation" do
    let(:test_class) { test_date_class }

    include_examples "an attribute with XML generation",
      "2024-01-15",
      "Test_Date",
      "999"

    it "generates XML from Date object" do
      xml_builder = Nokogiri::XML::Builder.new
      date = Date.new(2024, 1, 15)
      instance = test_date_class.new(date)
      instance.build_xml(xml_builder)

      xml = xml_builder.to_xml
      expect(xml).to include(">2024-01-15</Test_Date>")
    end
  end

  describe "edge cases" do
    it "handles dates far in the past" do
      instance = test_date_class.new("1900-01-01")
      expect(instance.value).to eq("1900-01-01")
    end

    it "handles dates far in the future" do
      instance = test_date_class.new("2099-12-31")
      expect(instance.value).to eq("2099-12-31")
    end

    it "handles leap year correctly" do
      instance = test_date_class.new("2024-02-29")
      expect(instance.value).to eq("2024-02-29")
    end

    it "handles century leap years" do
      instance = test_date_class.new("2000-02-29")
      expect(instance.value).to eq("2000-02-29")
    end

    it "rejects non-century leap years" do
      instance = test_date_class.new("1900-02-29")
      expect(instance.valid?).to be false
      expect(instance.validation_error.message).to match(/Invalid date format/)
    end
  end
end
