# frozen_string_literal: true

require "spec_helper"

RSpec.describe "ECCAIRS Edge Cases and Boundary Tests" do
  describe "Scenario 1: Extreme Weather Event with All Weather Phenomena" do
    it "generates a valid ECCAIRS set with comprehensive weather data" do
      set = Eccairs.set

      set.add_occurrence do |occurrence|
        occurrence.add_headline("Severe weather encounter - multiple phenomena")
        occurrence.add_location_name("North Atlantic")
        occurrence.add_utc_date("2024-12-15")
        occurrence.add_utc_time("03:45:00")
        occurrence.add_occurrence_category(1)
        occurrence.add_latitude_of_occ(55.0)
        occurrence.add_longitude_of_occ(-30.0)

        # Extreme weather conditions
        occurrence.add_air_temperature(-45.0) # Extreme cold
        occurrence.add_dew_point(-50.0)
        occurrence.add_wx_conditions(2) # IMC
        occurrence.add_wind_speed(85.0) # Hurricane force winds
        occurrence.add_wind_direction(315)
        occurrence.add_visibility(200) # Very low visibility
        occurrence.add_cloud_amount(6) # Heavy clouds

        # Multiple weather phenomena
        occurrence.add_precipitation_and_other_weather_phenomena do |weather|
          weather.add_phenomenon_intensity(3) # Heavy
          weather.add_phenomenon_type(1) # Rain
        end

        occurrence.add_precipitation_and_other_weather_phenomena do |weather|
          weather.add_phenomenon_intensity(3) # Heavy
          weather.add_phenomenon_type(2) # Snow
        end

        occurrence.add_precipitation_and_other_weather_phenomena do |weather|
          weather.add_phenomenon_intensity(3) # Heavy
          weather.add_phenomenon_type(3) # Ice
        end

        occurrence.add_precipitation_and_other_weather_phenomena do |weather|
          weather.add_phenomenon_intensity(2) # Moderate
          weather.add_phenomenon_type(4) # Turbulence
        end

        # Aircraft
        occurrence.add_aircraft(id: "AC1") do |aircraft|
          aircraft.add_aircraft_registration("N-STORM")
          aircraft.add_flight_phase(5) # Cruise
          aircraft.add_aircraft_altitude(35000)
          aircraft.add_total_number_of_persons(250)
          aircraft.add_aircraft_category(1)
        end

        # Airspace
        occurrence.add_air_space(id: "AS1") do |airspace|
          airspace.add_airspace_class(1)
          airspace.add_airspace_name("North Atlantic Tracks")
          airspace.add_airspace_type(2)
        end

        # Risk assessment
        occurrence.add_risk_assessment do |risk|
          risk.add_risk_level(4)
          risk.add_risk_grade(2)
          risk.add_risk_method(1)
        end

        narrative_text = <<~NARRATIVE.strip
          Aircraft N-STORM encountered severe weather conditions over the North Atlantic at
          FL350. The aircraft flew through an area of extreme meteorological activity with
          multiple simultaneous weather phenomena.

          Conditions included: extreme cold (-45°C), hurricane-force winds (85 knots),
          very low visibility (200m), heavy precipitation (rain, snow, and ice), and severe
          turbulence.

          The aircraft experienced severe icing, significant turbulence causing injuries to
          two cabin crew members, and temporary loss of some navigation equipment. The crew
          requested and received clearance to deviate from the planned route and descend to
          FL280 to escape the worst conditions.

          The aircraft landed safely at the alternate airport with no further incidents.
          Post-flight inspection revealed minor damage to the radome and leading edges due
          to ice impact.
        NARRATIVE

        occurrence.add_narrative do |narrative|
          narrative.add_narrative_text(narrative_text)
          narrative.add_narrative_language(1)
        end
      end

      expect(set.valid?).to be(true), "Report should be valid. Errors: #{set.validate.join(", ")}"

      xml = set.to_xml
      expect(xml).to include("Severe weather")
      expect(xml).to include("Precipitation_And_Other_Weather_Phenomena")
      expect(xml).to include("-45")
      expect(xml).to include("85")
    end
  end

  describe "Scenario 2: Maximum Entity Repetition - 10 Aircraft Formation Flight Incident" do
    it "generates a valid ECCAIRS set with many repeated entities" do
      set = Eccairs.set

      set.add_occurrence do |occurrence|
        occurrence.add_headline("Formation flight incident involving 10 military aircraft")
        occurrence.add_location_name("Military Training Area")
        occurrence.add_utc_date("2024-11-20")
        occurrence.add_utc_time("11:00:00")
        occurrence.add_occurrence_category(1)

        occurrence.add_air_temperature(20.0)
        occurrence.add_wx_conditions(1)

        # Add 10 aircraft
        (1..10).each do |i|
          occurrence.add_aircraft(id: "AC#{i}") do |aircraft|
            aircraft.add_aircraft_registration("MIL-#{i.to_s.rjust(3, "0")}")
            aircraft.add_flight_phase(5) # Cruise
            aircraft.add_aircraft_category(3) # Military
            aircraft.add_aircraft_altitude(15000 + (i * 100)) # Staggered altitudes
            aircraft.add_total_number_of_persons(2)

            # Each aircraft has an engine
            aircraft.add_engine do |engine|
              engine.add_engine_position(3)
              engine.add_engine_serial_number("ENG-#{i}-001")
            end

            # Each aircraft has crew
            aircraft.add_flight_crew_member do |crew|
              crew.add_category(1)
              crew.add_experience_all_a_c(1000.0 + (i * 100))
            end
          end
        end

        # Events
        occurrence.add_events(id: "EVT1") do |event|
          event.add_event_type("3000000") # Valid ECCAIRS event type code
          event.add_phase("10000") # Valid ECCAIRS phase code
        end

        narrative_text = <<~NARRATIVE.strip
          A formation flight exercise involving 10 military aircraft (MIL-001 through MIL-010)
          was conducting training operations in Military Training Area Alpha. The aircraft were
          flying in a complex formation at staggered altitudes from 15,000 to 16,000 feet.

          During a formation maneuver, aircraft MIL-005 experienced a temporary loss of
          situational awareness and deviated from its assigned position, coming within
          100 feet of aircraft MIL-006. Both pilots took immediate evasive action, and
          the formation was safely reformed.

          All 10 aircraft landed without incident. The exercise was terminated early for
          safety review. No injuries or damage occurred.
        NARRATIVE

        occurrence.add_narrative do |narrative|
          narrative.add_narrative_text(narrative_text)
          narrative.add_narrative_language(1)
        end
      end

      expect(set.valid?).to be(true), "Report should be valid. Errors: #{set.validate.join(", ")}"

      xml = set.to_xml
      expect(xml).to include("Formation flight")
      expect(xml).to include("MIL-001")
      expect(xml).to include("MIL-010")

      # Verify all 10 aircraft are in the XML
      (1..10).each do |i|
        expect(xml).to include("MIL-#{i.to_s.rjust(3, "0")}")
      end
    end
  end

  describe "Scenario 3: Deep Nesting - Aircraft with All Possible Sub-Entities" do
    it "generates a valid ECCAIRS set with maximum nesting depth" do
      set = Eccairs.set

      set.add_occurrence do |occurrence|
        occurrence.add_headline("Comprehensive aircraft incident with all sub-entities")
        occurrence.add_location_name("Test Location")
        occurrence.add_utc_date("2024-11-25")
        occurrence.add_utc_time("15:00:00")
        occurrence.add_occurrence_category(1)

        occurrence.add_aircraft(id: "AC1") do |aircraft|
          aircraft.add_aircraft_registration("N-DEEP")
          aircraft.add_flight_phase(5)
          aircraft.add_aircraft_category(1)
          aircraft.add_total_number_of_persons(200)
          aircraft.add_number_of_engines(4)
          aircraft.add_year_built(2020)
          aircraft.add_maximum_t_o_mass(400000)
          aircraft.add_aircraft_altitude(37000)
          aircraft.add_aircraft_total_time(15000.0)
          aircraft.add_total_cycles_a_c(8000)

          # Multiple engines
          aircraft.add_engine do |engine|
            engine.add_engine_position(1)
            engine.add_engine_serial_number("ENG-1")
            engine.add_cycles_since_new(8000)
            engine.add_cycles_since_overhaul(2000)
            engine.add_cycles_since_insp(500)
          end

          aircraft.add_engine do |engine|
            engine.add_engine_position(2)
            engine.add_engine_serial_number("ENG-2")
            engine.add_cycles_since_new(8000)
          end

          aircraft.add_engine do |engine|
            engine.add_engine_position(3)
            engine.add_engine_serial_number("ENG-3")
            engine.add_cycles_since_new(8000)
          end

          aircraft.add_engine do |engine|
            engine.add_engine_position(4)
            engine.add_engine_serial_number("ENG-4")
            engine.add_cycles_since_new(8000)
          end

          # Multiple flight crew members with licenses
          aircraft.add_flight_crew_member do |crew|
            crew.add_category(1) # Captain
            crew.add_experience_all_a_c(12000.0)
            crew.add_experience_this_a_c(5000.0)
            crew.add_duty_last_24_hours(8.0)
            crew.add_rest_before_duty(12.0)

            crew.add_flight_crew_licenses do |license|
              license.add_validity(1)
            end
          end

          aircraft.add_flight_crew_member do |crew|
            crew.add_category(2) # First Officer
            crew.add_experience_all_a_c(5000.0)
            crew.add_experience_this_a_c(1500.0)
            crew.add_duty_last_24_hours(8.0)
            crew.add_rest_before_duty(12.0)

            crew.add_flight_crew_licenses do |license|
              license.add_validity(1)
            end
          end

          aircraft.add_flight_crew_member do |crew|
            crew.add_category(3) # Relief Pilot
            crew.add_experience_all_a_c(8000.0)
            crew.add_experience_this_a_c(3000.0)

            crew.add_flight_crew_licenses do |license|
              license.add_validity(1)
            end
          end

          # Incapacitations
          aircraft.add_incapacitation do |incap|
            incap.add_person_incapacitated(1)
          end

          # Aircraft narrative
          aircraft.add_narrative do |narrative|
            narrative.add_narrative_text("Detailed aircraft-specific narrative.")
            narrative.add_narrative_language(1)
          end
        end

        occurrence.add_narrative do |narrative|
          narrative.add_narrative_text("Comprehensive test of deep nesting capabilities.")
          narrative.add_narrative_language(1)
        end
      end

      expect(set.valid?).to be(true), "Report should be valid. Errors: #{set.validate.join(", ")}"

      xml = set.to_xml
      expect(xml).to include("N-DEEP")
      expect(xml).to include("ENG-1")
      expect(xml).to include("ENG-2")
      expect(xml).to include("ENG-3")
      expect(xml).to include("ENG-4")
      expect(xml).to include("Flight_Crew_Member")
      expect(xml).to include("Flight_Crew_Licenses")
      expect(xml).to include("Incapacitation")
    end
  end

  describe "Scenario 4: Boundary Value Testing - Extreme Numeric Values" do
    it "handles extreme but valid numeric values correctly" do
      set = Eccairs.set

      set.add_occurrence do |occurrence|
        occurrence.add_headline("Boundary value test")
        occurrence.add_location_name("Test")
        occurrence.add_utc_date("2024-01-01")
        occurrence.add_utc_time("00:00:00")
        occurrence.add_occurrence_category(1)

        # Extreme coordinates
        occurrence.add_latitude_of_occ(89.9999) # Near North Pole
        occurrence.add_longitude_of_occ(179.9999) # Near date line

        # Extreme weather values
        occurrence.add_air_temperature(-80.0) # Extreme cold
        occurrence.add_wind_speed(200.0) # Extreme wind
        occurrence.add_visibility(50000) # Maximum visibility

        occurrence.add_aircraft(id: "AC1") do |aircraft|
          aircraft.add_aircraft_registration("TEST")
          aircraft.add_flight_phase(5)
          aircraft.add_aircraft_altitude(60000) # Very high altitude
          aircraft.add_maximum_t_o_mass(600000) # Very heavy aircraft
          aircraft.add_aircraft_total_time(100000.0) # Very high hours
          aircraft.add_total_cycles_a_c(50000) # Very high cycles
        end

        occurrence.add_narrative do |narrative|
          narrative.add_narrative_text("Boundary value testing.")
          narrative.add_narrative_language(1)
        end
      end

      expect(set.valid?).to be(true), "Report should be valid. Errors: #{set.validate.join(", ")}"

      xml = set.to_xml
      expect(xml).to include("89.9999")
      expect(xml).to include("179.9999")
      expect(xml).to include("-80")
      expect(xml).to include("60000")
    end
  end
end
