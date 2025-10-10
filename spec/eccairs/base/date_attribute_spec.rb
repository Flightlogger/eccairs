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
        expect { test_date_class.new("01/15/2024") }.to raise_error(ArgumentError, /Invalid date format/)
      end

      it "rejects date with wrong separator" do
        expect { test_date_class.new("2024/01/15") }.to raise_error(ArgumentError, /Invalid date format/)
      end

      it "rejects date without separators" do
        expect { test_date_class.new("20240115") }.to raise_error(ArgumentError, /Invalid date format/)
      end

      it "rejects invalid month" do
        expect { test_date_class.new("2024-13-01") }.to raise_error(ArgumentError, /Invalid date format/)
      end

      it "rejects invalid day" do
        expect { test_date_class.new("2024-01-32") }.to raise_error(ArgumentError, /Invalid date format/)
      end

      it "rejects February 30th" do
        expect { test_date_class.new("2024-02-30") }.to raise_error(ArgumentError, /Invalid date format/)
      end

      it "rejects February 29th in non-leap year" do
        expect { test_date_class.new("2023-02-29") }.to raise_error(ArgumentError, /Invalid date format/)
      end

      it "rejects incomplete date" do
        expect { test_date_class.new("2024-01") }.to raise_error(ArgumentError, /Invalid date format/)
      end

      it "rejects date with time component" do
        expect { test_date_class.new("2024-01-15T10:30:00") }.to raise_error(ArgumentError, /Invalid date format/)
      end
    end

    describe "with invalid types" do
      it "rejects integer" do
        expect { test_date_class.new(20240115) }.to raise_error(ArgumentError, /must be a Date or ISO 8601 date string/)
      end

      it "rejects float" do
        expect { test_date_class.new(2024.0115) }.to raise_error(ArgumentError, /must be a Date or ISO 8601 date string/)
      end

      it "rejects array" do
        expect { test_date_class.new([2024, 1, 15]) }.to raise_error(ArgumentError, /must be a Date or ISO 8601 date string/)
      end

      it "rejects hash" do
        expect { test_date_class.new({year: 2024, month: 1, day: 15}) }.to raise_error(ArgumentError, /must be a Date or ISO 8601 date string/)
      end

      it "rejects Time object" do
        time = Time.new(2024, 1, 15, 10, 30, 0)
        expect { test_date_class.new(time) }.to raise_error(ArgumentError, /must be a Date or ISO 8601 date string/)
      end
    end

    describe "with nil value" do
      it "accepts nil value" do
        instance = test_date_class.new(nil)
        expect(instance.value).to be_nil
      end

      it "does not validate nil" do
        expect { test_date_class.new(nil) }.not_to raise_error
      end
    end

    describe "value assignment" do
      it "validates on value assignment" do
        instance = test_date_class.new("2024-01-15")
        expect { instance.value = "invalid" }.to raise_error(ArgumentError, /Invalid date format/)
      end

      it "allows changing to another valid value" do
        instance = test_date_class.new("2024-01-15")
        instance.value = "2024-12-31"
        expect(instance.value).to eq("2024-12-31")
      end
    end
  end

  describe "XML generation" do
    it "generates XML with date value" do
      xml_builder = Nokogiri::XML::Builder.new
      instance = test_date_class.new("2024-01-15")
      instance.build_xml(xml_builder)

      xml = xml_builder.to_xml
      expect(xml).to include("Test_Date")
      expect(xml).to include(">2024-01-15</Test_Date>")
      expect(xml).to include('attributeId="999"')
    end

    it "generates XML from Date object" do
      xml_builder = Nokogiri::XML::Builder.new
      date = Date.new(2024, 1, 15)
      instance = test_date_class.new(date)
      instance.build_xml(xml_builder)

      xml = xml_builder.to_xml
      expect(xml).to include(">2024-01-15</Test_Date>")
    end

    it "does not generate XML for nil value" do
      xml_builder = Nokogiri::XML::Builder.new
      instance = test_date_class.new(nil)
      instance.build_xml(xml_builder)

      xml = xml_builder.to_xml
      expect(xml).not_to include("Test_Date")
    end
  end

  describe "real-world date attribute" do
    it "validates EventDate correctly" do
      instance = Eccairs::Attributes::EventDate.new("2024-01-15")
      expect(instance.value).to eq("2024-01-15")
    end

    it "generates valid XML in occurrence" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_event_date("2024-01-15")
      end

      xml = set.to_xml
      expect(xml).to include("Event_Date")
      expect(xml).to include(">2024-01-15</Event_Date>")
    end

    it "validates successfully" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_event_date("2024-01-15")
      end

      errors = set.validate
      expect(errors).to be_empty
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
      expect { test_date_class.new("1900-02-29") }.to raise_error(ArgumentError, /Invalid date format/)
    end
  end
end
