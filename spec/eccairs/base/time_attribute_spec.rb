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
        expect { test_time_class.new("14:30") }.to raise_error(ArgumentError, /must be in HH:MM:SS format/)
      end

      it "rejects time with milliseconds" do
        expect { test_time_class.new("14:30:45.123") }.to raise_error(ArgumentError, /must be in HH:MM:SS format/)
      end

      it "rejects 12-hour format" do
        expect { test_time_class.new("2:30:45 PM") }.to raise_error(ArgumentError, /must be in HH:MM:SS format/)
      end

      it "rejects invalid hour" do
        expect { test_time_class.new("24:00:00") }.to raise_error(ArgumentError, /must be in HH:MM:SS format/)
      end

      it "rejects invalid minute" do
        expect { test_time_class.new("14:60:00") }.to raise_error(ArgumentError, /must be in HH:MM:SS format/)
      end

      it "rejects invalid second" do
        expect { test_time_class.new("14:30:60") }.to raise_error(ArgumentError, /must be in HH:MM:SS format/)
      end

      it "rejects time without colons" do
        expect { test_time_class.new("143045") }.to raise_error(ArgumentError, /must be in HH:MM:SS format/)
      end

      it "rejects time with wrong separator" do
        expect { test_time_class.new("14.30.45") }.to raise_error(ArgumentError, /must be in HH:MM:SS format/)
      end

      it "rejects single digit hours" do
        expect { test_time_class.new("9:30:45") }.to raise_error(ArgumentError, /must be in HH:MM:SS format/)
      end

      it "rejects single digit minutes" do
        expect { test_time_class.new("09:5:45") }.to raise_error(ArgumentError, /must be in HH:MM:SS format/)
      end

      it "rejects single digit seconds" do
        expect { test_time_class.new("09:05:3") }.to raise_error(ArgumentError, /must be in HH:MM:SS format/)
      end
    end

    describe "with invalid types" do
      it "rejects integer" do
        expect { test_time_class.new(143045) }.to raise_error(ArgumentError, /must be a Time or time string/)
      end

      it "rejects float" do
        expect { test_time_class.new(14.3045) }.to raise_error(ArgumentError, /must be a Time or time string/)
      end

      it "rejects array" do
        expect { test_time_class.new([14, 30, 45]) }.to raise_error(ArgumentError, /must be a Time or time string/)
      end

      it "rejects hash" do
        expect { test_time_class.new({hour: 14, minute: 30, second: 45}) }.to raise_error(ArgumentError, /must be a Time or time string/)
      end

      it "rejects Date object" do
        date = Date.new(2024, 1, 15)
        expect { test_time_class.new(date) }.to raise_error(ArgumentError, /must be a Time or time string/)
      end
    end

    describe "with nil value" do
      it "accepts nil value" do
        instance = test_time_class.new(nil)
        expect(instance.value).to be_nil
      end

      it "does not validate nil" do
        expect { test_time_class.new(nil) }.not_to raise_error
      end
    end

    describe "value assignment" do
      it "validates on value assignment" do
        instance = test_time_class.new("14:30:45")
        expect { instance.value = "invalid" }.to raise_error(ArgumentError, /must be in HH:MM:SS format/)
      end

      it "allows changing to another valid value" do
        instance = test_time_class.new("14:30:45")
        instance.value = "09:15:30"
        expect(instance.value).to eq("09:15:30")
      end
    end
  end

  describe "XML generation" do
    it "generates XML with time value" do
      xml_builder = Nokogiri::XML::Builder.new
      instance = test_time_class.new("14:30:45")
      instance.build_xml(xml_builder)

      xml = xml_builder.to_xml
      expect(xml).to include("Test_Time")
      expect(xml).to include(">14:30:45</Test_Time>")
      expect(xml).to include('attributeId="999"')
    end

    it "generates XML from Time object" do
      xml_builder = Nokogiri::XML::Builder.new
      time = Time.new(2024, 1, 15, 14, 30, 45)
      instance = test_time_class.new(time)
      instance.build_xml(xml_builder)

      xml = xml_builder.to_xml
      expect(xml).to include(">14:30:45</Test_Time>")
    end

    it "does not generate XML for nil value" do
      xml_builder = Nokogiri::XML::Builder.new
      instance = test_time_class.new(nil)
      instance.build_xml(xml_builder)

      xml = xml_builder.to_xml
      expect(xml).not_to include("Test_Time")
    end
  end

  describe "real-world time attribute" do
    it "validates EventTime correctly" do
      instance = Eccairs::Attributes::EventTime.new("14:30:45")
      expect(instance.value).to eq("14:30:45")
    end

    it "generates valid XML in occurrence" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_event_time("14:30:45")
      end

      xml = set.to_xml
      expect(xml).to include("Event_Time")
      expect(xml).to include(">14:30:45</Event_Time>")
    end

    it "validates successfully" do
      set = Eccairs.set
      set.add_occurrence do |occurrence|
        occurrence.add_event_time("14:30:45")
      end

      errors = set.validate
      expect(errors).to be_empty
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
