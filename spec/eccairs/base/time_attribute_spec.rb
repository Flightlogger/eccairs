# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Base::TimeAttribute do
  let(:test_time_class) do
    Class.new(described_class) do
      attribute_id "999"
      xml_tag "Test_Time"
    end
  end

  describe "validation" do
    describe "with Time objects" do
      it "accepts Time object" do
        time = Time.new(2024, 1, 15, 14, 30, 45)
        instance = test_time_class.new(time)
        expect(instance.value).to eq("14:30:45")
      end

      it "converts Time to HH:MM:SS format" do
        time = Time.new(2024, 1, 15, 9, 5, 3)
        instance = test_time_class.new(time)
        expect(instance.value).to eq("09:05:03")
      end

      it "handles midnight" do
        time = Time.new(2024, 1, 15, 0, 0, 0)
        instance = test_time_class.new(time)
        expect(instance.value).to eq("00:00:00")
      end

      it "handles noon" do
        time = Time.new(2024, 1, 15, 12, 0, 0)
        instance = test_time_class.new(time)
        expect(instance.value).to eq("12:00:00")
      end

      it "handles end of day" do
        time = Time.new(2024, 1, 15, 23, 59, 59)
        instance = test_time_class.new(time)
        expect(instance.value).to eq("23:59:59")
      end
    end

    describe "with string values" do
      it "accepts valid HH:MM:SS format" do
        instance = test_time_class.new("14:30:45")
        expect(instance.value).to eq("14:30:45")
      end

      it "accepts time with leading zeros" do
        instance = test_time_class.new("09:05:03")
        expect(instance.value).to eq("09:05:03")
      end

      it "accepts midnight" do
        instance = test_time_class.new("00:00:00")
        expect(instance.value).to eq("00:00:00")
      end

      it "accepts noon" do
        instance = test_time_class.new("12:00:00")
        expect(instance.value).to eq("12:00:00")
      end

      it "accepts end of day" do
        instance = test_time_class.new("23:59:59")
        expect(instance.value).to eq("23:59:59")
      end

      it "rejects time without seconds" do
        instance = test_time_class.new("14:30")
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/must be in HH:MM:SS format/)
      end

      it "rejects time with milliseconds" do
        instance = test_time_class.new("14:30:45.123")
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/must be in HH:MM:SS format/)
      end

      it "rejects 12-hour format" do
        instance = test_time_class.new("2:30:45 PM")
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/must be in HH:MM:SS format/)
      end

      it "rejects invalid hour" do
        instance = test_time_class.new("24:00:00")
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/must be in HH:MM:SS format/)
      end

      it "rejects invalid minute" do
        instance = test_time_class.new("14:60:00")
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/must be in HH:MM:SS format/)
      end

      it "rejects invalid second" do
        instance = test_time_class.new("14:30:60")
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/must be in HH:MM:SS format/)
      end

      it "rejects time without colons" do
        instance = test_time_class.new("143045")
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/must be in HH:MM:SS format/)
      end

      it "rejects time with wrong separator" do
        instance = test_time_class.new("14.30.45")
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/must be in HH:MM:SS format/)
      end

      it "rejects single digit hours" do
        instance = test_time_class.new("9:30:45")
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/must be in HH:MM:SS format/)
      end

      it "rejects single digit minutes" do
        instance = test_time_class.new("09:5:45")
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/must be in HH:MM:SS format/)
      end

      it "rejects single digit seconds" do
        instance = test_time_class.new("09:05:3")
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/must be in HH:MM:SS format/)
      end
    end

    describe "with invalid types" do
      let(:test_class) { test_time_class }

      include_examples "an attribute that rejects invalid types", [
        ["integer", 143045, /must be a Time or time string/],
        ["float", 14.3045, /must be a Time or time string/],
        ["array", [14, 30, 45], /must be a Time or time string/],
        ["hash", {hour: 14, minute: 30, second: 45}, /must be a Time or time string/]
      ]

      it "rejects Date object" do
        date = Date.new(2024, 1, 15)
        instance = test_time_class.new(date)
        expect(instance.valid?).to be false
        expect(instance.validation_error.message).to match(/must be a Time or time string/)
      end
    end

    describe "with nil value" do
      let(:test_class) { test_time_class }

      include_examples "an attribute with nil value handling"
    end

    describe "value assignment" do
      let(:test_class) { test_time_class }

      include_examples "an attribute with value assignment",
        "14:30:45",
        "invalid",
        /must be in HH:MM:SS format/

      it "allows changing to another valid value", alternate_valid_value: "09:15:30" do
        instance = test_time_class.new("14:30:45")
        instance.value = "09:15:30"
        expect(instance.value).to eq("09:15:30")
      end
    end
  end

  describe "XML generation" do
    let(:test_class) { test_time_class }

    include_examples "an attribute with XML generation",
      "14:30:45",
      "Test_Time",
      "999"

    it "generates XML from Time object" do
      xml_builder = Nokogiri::XML::Builder.new
      time = Time.new(2024, 1, 15, 14, 30, 45)
      instance = test_time_class.new(time)
      instance.build_xml(xml_builder)

      xml = xml_builder.to_xml
      expect(xml).to include(">14:30:45</Test_Time>")
    end
  end

  describe "edge cases" do
    it "handles midnight exactly" do
      instance = test_time_class.new("00:00:00")
      expect(instance.value).to eq("00:00:00")
    end

    it "handles one second before midnight" do
      instance = test_time_class.new("23:59:59")
      expect(instance.value).to eq("23:59:59")
    end

    it "handles noon exactly" do
      instance = test_time_class.new("12:00:00")
      expect(instance.value).to eq("12:00:00")
    end

    it "preserves leading zeros" do
      instance = test_time_class.new("01:02:03")
      expect(instance.value).to eq("01:02:03")
    end
  end
end
