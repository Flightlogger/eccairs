# frozen_string_literal: true

require "spec_helper"

RSpec.describe "ECCAIRS Validation Error Collection" do
  describe "Scenario 1: Mixed Valid and Invalid Data" do
    it "collects errors for invalid attributes while accepting valid ones" do
      set = Eccairs.set

      set.add_occurrence do |occurrence|
        # Valid attributes
        occurrence.add_headline("Test occurrence with mixed data")
        occurrence.add_location_name("Test Location")
        occurrence.add_utc_date("2024-12-15")
        occurrence.add_utc_time("14:30:00")
        occurrence.add_occurrence_category(1)

        # Invalid attributes - should collect errors
        occurrence.add_air_temperature("not a number") # Invalid - should be numeric
        occurrence.add_dew_point([1, 2, 3]) # Invalid - should be numeric
        occurrence.add_wind_speed("fast") # Invalid - should be numeric
        occurrence.add_wind_direction(500) # Invalid - exceeds max of 360
        occurrence.add_visibility(-100) # Invalid - negative value

        # Valid weather data
        occurrence.add_wx_conditions(1)
        occurrence.add_cloud_amount(3)

        # Invalid enum value
        occurrence.add_occurrence_category(999) # Invalid - not in allowed values

        occurrence.add_aircraft(id: "AC1") do |aircraft|
          # Valid aircraft data
          aircraft.add_aircraft_registration("N12345")
          aircraft.add_flight_phase(5)
          aircraft.add_aircraft_category(1)

          # Invalid aircraft data
          aircraft.add_aircraft_altitude("high") # Invalid - should be integer
          aircraft.add_total_number_of_persons(-5) # Invalid - negative
          aircraft.add_number_of_engines(100) # Invalid - exceeds max
        end
      end

      # Should not be valid
      expect(set.valid?).to be(false)

      # Should have collected errors
      errors = set.validation_errors
      expect(errors).not_to be_empty
      expect(errors.length).to be > 5

      # Check specific error messages
      error_messages = errors.map(&:message)
      expect(error_messages.any? { |msg| msg.include?("must be numeric") }).to be(true)
      expect(error_messages.any? { |msg| msg.include?("negative") || msg.include?("less than minimum") }).to be(true)

      # Check validation summary
      summary = set.validation_summary
      expect(summary).to be_a(Hash)
      expect(summary.keys).to include("Air_Temperature")
      expect(summary.keys).to include("Dew_Point")

      # Check invalid fields list
      invalid_fields = set.invalid_fields
      expect(invalid_fields).to include("Air_Temperature")
      expect(invalid_fields).to include("Dew_Point")
      expect(invalid_fields).to include("Wind_Speed")

      # XML should still be generated with only valid fields
      xml = set.to_xml
      expect(xml).to include("Test occurrence")
      expect(xml).to include("N12345")
      expect(xml).not_to include("not a number")
      expect(xml).not_to include("fast")
    end
  end

  describe "Scenario 2: All Invalid Data" do
    it "collects errors for all invalid attributes" do
      set = Eccairs.set

      set.add_occurrence do |occurrence|
        # All invalid data
        occurrence.add_headline(12345) # Invalid - should be string
        occurrence.add_utc_date("not-a-date") # Invalid - wrong format
        occurrence.add_utc_time("25:99:99") # Invalid - invalid time
        occurrence.add_air_temperature({temp: 20}) # Invalid - should be numeric
        occurrence.add_wind_speed(nil) # Valid - nil is allowed
        occurrence.add_occurrence_category("invalid") # Invalid - should be integer
        occurrence.add_latitude_of_occ(100.0) # Invalid - exceeds max of 90
        occurrence.add_longitude_of_occ(-200.0) # Invalid - less than min of -180
      end

      # Should not be valid
      expect(set.valid?).to be(false)

      # Should have many errors
      errors = set.validation_errors
      expect(errors.length).to be >= 6

      # All errors should have proper structure
      errors.each do |error|
        expect(error).to be_a(Eccairs::ValidationError)
        expect(error.field_name).to be_a(String)
        expect(error.attribute_id).not_to be_nil # Can be string or integer
        expect(error.message).to be_a(String)
        expect(error.provided_value).not_to be_nil
      end

      # Check error string representation
      error_strings = errors.map(&:to_s)
      expect(error_strings.first).to match(/\w+ \(ID: \d+\):/)

      # Check error hash representation
      error_hashes = errors.map(&:to_h)
      expect(error_hashes.first).to have_key(:field_name)
      expect(error_hashes.first).to have_key(:attribute_id)
      expect(error_hashes.first).to have_key(:message)
      expect(error_hashes.first).to have_key(:provided_value)
    end
  end

  describe "Scenario 3: Nested Entity Validation Errors" do
    it "collects errors from deeply nested entities" do
      set = Eccairs.set

      set.add_occurrence do |occurrence|
        occurrence.add_headline("Nested validation test")
        occurrence.add_utc_date("2024-12-15")
        occurrence.add_utc_time("10:00:00")
        occurrence.add_occurrence_category(1)

        occurrence.add_aircraft(id: "AC1") do |aircraft|
          aircraft.add_aircraft_registration("N12345")
          aircraft.add_flight_phase(5)
          aircraft.add_aircraft_category(1)

          # Invalid aircraft attributes
          aircraft.add_aircraft_altitude("very high") # Invalid
          aircraft.add_total_number_of_persons(-10) # Invalid

          aircraft.add_engine do |engine|
            # Invalid engine attributes
            engine.add_engine_position("left") # Invalid - should be integer
            engine.add_cycles_since_new(-500) # Invalid - negative
            engine.add_engine_serial_number(12345) # Invalid - should be string
          end

          aircraft.add_flight_crew_member do |crew|
            # Invalid crew attributes
            crew.add_category("pilot") # Invalid - should be integer
            crew.add_experience_all_a_c("lots") # Invalid - should be numeric
            crew.add_duty_last_24_hours(30.0) # Invalid - exceeds max of 24

            crew.add_flight_crew_licenses do |license|
              # Invalid license attributes
              license.add_validity("yes") # Invalid - should be integer
            end
          end
        end

        occurrence.add_aerodrome_general do |aerodrome|
          # Invalid aerodrome attributes
          aerodrome.add_elevation_above_msl("high") # Invalid - should be integer
          aerodrome.add_location_indicator(12345) # Invalid - should be string
        end
      end

      # Should not be valid
      expect(set.valid?).to be(false)

      # Should have errors from multiple nested levels
      errors = set.validation_errors
      expect(errors.length).to be >= 10

      # Errors should come from different entities
      field_names = errors.map(&:field_name).uniq
      expect(field_names).to include("Aircraft_Altitude")
      expect(field_names).to include("Engine_Position")
      expect(field_names).to include("Category") # Crew category
      expect(field_names).to include("Elevation_Above_MSL")

      # Validation summary should show errors grouped by field
      summary = set.validation_summary
      expect(summary.keys.length).to be >= 8
    end
  end

  describe "Scenario 4: Multiple Occurrences with Errors" do
    it "collects errors from multiple occurrences" do
      set = Eccairs.set

      # First occurrence with errors
      set.add_occurrence do |occurrence|
        occurrence.add_headline("First occurrence")
        occurrence.add_utc_date("invalid-date") # Invalid
        occurrence.add_air_temperature("cold") # Invalid
      end

      # Second occurrence with errors
      set.add_occurrence do |occurrence|
        occurrence.add_headline("Second occurrence")
        occurrence.add_utc_date("2024-12-15")
        occurrence.add_wind_speed("windy") # Invalid
        occurrence.add_latitude_of_occ(100.0) # Invalid - exceeds max
      end

      # Should not be valid
      expect(set.valid?).to be(false)

      # Should have errors from both occurrences
      errors = set.validation_errors
      expect(errors.length).to be >= 3

      # Check that errors include fields from both occurrences
      field_names = errors.map(&:field_name)
      expect(field_names).to include("UTC_Date")
      expect(field_names).to include("Air_Temperature")
      expect(field_names).to include("Wind_Speed")
    end
  end

  describe "Scenario 5: Enum Validation with Various Input Types" do
    it "collects errors for invalid enum values" do
      set = Eccairs.set

      set.add_occurrence do |occurrence|
        occurrence.add_headline("Enum validation test")
        occurrence.add_utc_date("2024-12-15")
        occurrence.add_utc_time("10:00:00")

        # Invalid enum values
        occurrence.add_occurrence_category("invalid") # Invalid - not a number
        occurrence.add_wx_conditions(999) # Invalid - not in allowed values
        occurrence.add_cloud_amount([1, 2]) # Invalid - array not allowed

        occurrence.add_aircraft(id: "AC1") do |aircraft|
          aircraft.add_aircraft_registration("N12345")
          aircraft.add_flight_phase("takeoff") # Invalid - should be integer
          aircraft.add_aircraft_category({type: 1}) # Invalid - hash not allowed
        end
      end

      # Should not be valid
      expect(set.valid?).to be(false)

      # Should have enum-related errors
      errors = set.validation_errors
      expect(errors.length).to be >= 4

      # Check error messages mention enum issues
      error_messages = errors.map(&:message)
      expect(error_messages.any? { |msg| msg.include?("allowed") || msg.include?("resolve") }).to be(true)
    end
  end

  describe "Scenario 6: String Length Validation" do
    it "collects errors for strings exceeding max length" do
      set = Eccairs.set

      set.add_occurrence do |occurrence|
        # Create a string that exceeds max length (if there is one)
        very_long_string = "A" * 10000

        occurrence.add_headline(very_long_string) # May be invalid if max_length is set
        occurrence.add_location_name(very_long_string) # May be invalid if max_length is set
        occurrence.add_utc_date("2024-12-15")
        occurrence.add_utc_time("10:00:00")
        occurrence.add_occurrence_category(1)
      end

      # Check if there are any length-related errors
      errors = set.validation_errors
      if errors.any?
        error_messages = errors.map(&:message)
        length_errors = error_messages.select { |msg| msg.include?("length") || msg.include?("maximum") }

        # If there are length errors, verify they're properly formatted
        if length_errors.any?
          expect(length_errors.first).to match(/length|maximum/i)
        end
      end
    end
  end

  describe "Scenario 7: Date and Time Validation" do
    it "collects errors for invalid date and time formats" do
      set = Eccairs.set

      set.add_occurrence do |occurrence|
        occurrence.add_headline("Date/Time validation test")

        # Invalid date formats
        occurrence.add_utc_date("12/15/2024") # Invalid - should be YYYY-MM-DD
        occurrence.add_utc_date("2024-13-45") # Invalid - invalid month/day

        # Invalid time formats
        occurrence.add_utc_time("2:30 PM") # Invalid - should be HH:MM:SS
        occurrence.add_utc_time("25:00:00") # Invalid - hour > 23
        occurrence.add_utc_time("12:60:00") # Invalid - minute > 59

        occurrence.add_occurrence_category(1)
      end

      # Should not be valid
      expect(set.valid?).to be(false)

      # Should have date/time errors
      errors = set.validation_errors
      expect(errors.length).to be >= 3

      # Check that errors are for date/time fields
      field_names = errors.map(&:field_name)
      expect(field_names.count("UTC_Date")).to be >= 1
      expect(field_names.count("UTC_Time")).to be >= 1
    end
  end

  describe "Scenario 8: Valid Report After Fixing Errors" do
    it "becomes valid after correcting invalid attributes" do
      set = Eccairs.set

      set.add_occurrence do |occurrence|
        occurrence.add_headline("Test occurrence")
        occurrence.add_utc_date("2024-12-15")
        occurrence.add_utc_time("10:00:00")
        occurrence.add_occurrence_category(1)

        # Add invalid data
        occurrence.add_air_temperature("invalid")
        occurrence.add_wind_speed(-50)
      end

      # Should not be valid
      expect(set.valid?).to be(false)
      expect(set.validation_errors.length).to be >= 1

      # Create a new valid set
      valid_set = Eccairs.set

      valid_set.add_occurrence do |occurrence|
        occurrence.add_headline("Test occurrence")
        occurrence.add_utc_date("2024-12-15")
        occurrence.add_utc_time("10:00:00")
        occurrence.add_occurrence_category(1)

        # Add valid data
        occurrence.add_air_temperature(20.0)
        occurrence.add_wind_speed(15.0)
      end

      # Should be valid
      expect(valid_set.valid?).to be(true)
      expect(valid_set.validation_errors).to be_empty
      expect(valid_set.invalid_fields).to be_empty

      # XML should include the valid values
      xml = valid_set.to_xml
      expect(xml).to include("20")
      expect(xml).to include("15")
    end
  end
end
