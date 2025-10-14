# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Realistic ECCAIRS XML Generation Scenarios" do
  describe "Scenario 1: Bird Strike During Takeoff" do
    it "generates a valid ECCAIRS set for a bird strike incident" do
      set = Eccairs.set

      set.add_occurrence do |occurrence|
        # Basic occurrence information
        occurrence.add_headline("Bird strike during takeoff roll")
        occurrence.add_location_name("John F. Kennedy International Airport")
        occurrence.add_utc_date("2024-03-15")
        occurrence.add_utc_time("14:30:00")
        occurrence.add_local_date("2024-03-15")
        occurrence.add_local_time("10:30:00")
        occurrence.add_occurrence_category(1)

        # Weather conditions
        occurrence.add_air_temperature(18.0)
        occurrence.add_dew_point(12.0)
        occurrence.add_wx_conditions(1) # VMC
        occurrence.add_wind_speed(8.0)
        occurrence.add_wind_direction(270)
        occurrence.add_visibility(10000)

        # Aerodrome information
        occurrence.add_aerodrome_general do |aerodrome|
          aerodrome.add_location_indicator("1000")
          aerodrome.add_aerodrome_latitude(40.6413)
          aerodrome.add_aerodrome_longitude(-73.7781)
          aerodrome.add_elevation_above_msl(13.0)
          aerodrome.add_aerodrome_type(1)

          # Runway information
          aerodrome.add_runway do |runway|
            runway.add_runway_identifier("04R")
            runway.add_runway_number(4)
          end
        end

        # Aircraft information
        occurrence.add_aircraft do |aircraft|
          aircraft.add_aircraft_registration("N12345")
          aircraft.add_year_built(2018)
          aircraft.add_maximum_t_o_mass(79000)
          aircraft.add_number_of_engines(2)
          aircraft.add_flight_phase(3) # Takeoff

          # Bird strike details
          aircraft.add_birds_wildlife_seen(1)
          aircraft.add_birds_wildlife_struck(1)
          aircraft.add_bird_size(1)
        end

        # Narrative
        narrative_text = "During takeoff roll on runway 04R, at approximately 80 knots, " \
          "the crew observed a flock of birds crossing the runway. " \
          "Unable to stop safely, the aircraft continued the takeoff. " \
          "Multiple bird strikes were felt and heard. The takeoff was completed " \
          "successfully and the aircraft returned for landing after dumping fuel. " \
          "Post-flight inspection revealed damage to the nose cone and engine inlet."

        occurrence.add_narrative do |narrative|
          narrative.add_narrative_text(narrative_text)
          narrative.add_narrative_language(1) # English
        end
      end

      # Validate the set
      expect(set.valid?).to be(true), "Report should be valid. Errors: #{set.validate.join(", ")}"

      # Check XML structure
      xml = set.to_xml
      expect(xml).to include("Bird strike during takeoff roll")
      expect(xml).to include("John F. Kennedy International Airport")
      expect(xml).to include("N12345")
      expect(xml).to include("04R")
      expect(xml).to include("Multiple bird strikes")
    end
  end

  describe "Scenario 2: Runway Incursion with ATC Involvement" do
    it "generates a valid ECCAIRS set for a runway incursion" do
      set = Eccairs.set

      set.add_occurrence do |occurrence|
        # Basic occurrence information
        occurrence.add_headline("Runway incursion - vehicle crossed active runway")
        occurrence.add_location_name("London Heathrow Airport")
        occurrence.add_utc_date("2024-06-20")
        occurrence.add_utc_time("09:15:00")
        occurrence.add_local_date("2024-06-20")
        occurrence.add_local_time("10:15:00")
        occurrence.add_occurrence_category(1)

        # Weather conditions - good visibility
        occurrence.add_wx_conditions(1) # VMC
        occurrence.add_visibility(10000)
        occurrence.add_air_temperature(22.0)
        occurrence.add_wind_speed(5.0)
        occurrence.add_wind_direction(90)

        # Aerodrome information
        occurrence.add_aerodrome_general do |aerodrome|
          aerodrome.add_location_indicator("1000")
          aerodrome.add_aerodrome_latitude(51.4700)
          aerodrome.add_aerodrome_longitude(-0.4543)
          aerodrome.add_aerodrome_type(1)
          aerodrome.add_location_on_near_aerodrome(1) # Runway

          # Runway information
          aerodrome.add_runway do |runway|
            runway.add_runway_identifier("27L")
          end
        end

        # Aircraft information (aircraft on approach)
        occurrence.add_aircraft do |aircraft|
          aircraft.add_aircraft_registration("G-ABCD")
          aircraft.add_flight_phase(6) # Approach
        end

        # Air Navigation Service information
        occurrence.add_air_navigation_service do |ans|
          ans.add_ansp_name("NATS")

          ans.add_sector do |sector|
            sector.add_sector_name("Tower")
            sector.add_services_provided(2000000)
          end
        end

        # Narrative
        narrative_text = "An airport maintenance vehicle crossed runway 27L without clearance " \
          "while an aircraft was on final approach at 3 miles. The tower controller " \
          "immediately instructed the aircraft to go around. The aircraft executed " \
          "the go-around successfully with no damage or injuries. Investigation revealed " \
          "a communication breakdown between ground control and the vehicle driver."

        occurrence.add_narrative do |narrative|
          narrative.add_narrative_text(narrative_text)
          narrative.add_narrative_language(1)
        end
      end

      # Validate the set
      expect(set.valid?).to be(true), "Report should be valid. Errors: #{set.validate.join(", ")}"

      # Check XML structure
      xml = set.to_xml
      expect(xml).to include("Runway incursion")
      expect(xml).to include("London Heathrow Airport")
      expect(xml).to include("G-ABCD")
      expect(xml).to include("27L")
      expect(xml).to include("NATS")
      expect(xml).to include("communication breakdown")
    end
  end

  describe "Scenario 3: Engine Failure During Cruise" do
    it "generates a valid ECCAIRS set for an engine failure" do
      set = Eccairs.set

      set.add_occurrence do |occurrence|
        # Basic occurrence information
        occurrence.add_headline("Engine failure during cruise - successful emergency landing")
        occurrence.add_location_name("Over North Atlantic")
        occurrence.add_utc_date("2024-08-10")
        occurrence.add_utc_time("16:45:00")
        occurrence.add_latitude_of_occ(45.5)
        occurrence.add_longitude_of_occ(-30.2)
        occurrence.add_occurrence_category(1)

        # Weather conditions
        occurrence.add_wx_conditions(2) # IMC
        occurrence.add_air_temperature(-40.0)
        occurrence.add_wind_speed(45.0)
        occurrence.add_wind_direction(270)

        # Aircraft information
        occurrence.add_aircraft do |aircraft|
          aircraft.add_aircraft_registration("N98765")
          aircraft.add_year_built(2015)
          aircraft.add_maximum_t_o_mass(250000)
          aircraft.add_number_of_engines(2)
          aircraft.add_flight_phase(5) # Cruise
          aircraft.add_total_number_of_persons(189)

          # Engine information
          aircraft.add_engine do |engine|
            engine.add_engine_position(2) # Right
            engine.add_engine_serial_number("ENG-54321")
            engine.add_hazard_eng_effect(1)
          end
        end

        # Narrative
        narrative_text = "During cruise at FL370, the crew experienced a sudden vibration followed by " \
          "engine fire warnings on the right engine. The crew executed the engine fire " \
          "checklist, shut down the right engine, and discharged both fire bottles. " \
          "The fire warning extinguished. The crew declared an emergency and diverted " \
          "to the nearest suitable airport. The aircraft landed safely on one engine " \
          "with no injuries. Post-incident inspection revealed a catastrophic failure " \
          "of a high-pressure turbine blade, resulting in significant engine damage."

        occurrence.add_narrative do |narrative|
          narrative.add_narrative_text(narrative_text)
          narrative.add_narrative_language(1)
        end
      end

      # Validate the set
      expect(set.valid?).to be(true), "Report should be valid. Errors: #{set.validate.join(", ")}"

      # Check XML structure
      xml = set.to_xml
      expect(xml).to include("Engine failure during cruise")
      expect(xml).to include("N98765")
      expect(xml).to include("high-pressure turbine blade")
      expect(xml).to include("catastrophic failure")
    end
  end

  describe "Scenario 4: Multi-Engine Aircraft with Multiple Crew Members" do
    it "generates a valid ECCAIRS set with multiple engines and crew members" do
      set = Eccairs.set

      set.add_occurrence do |occurrence|
        # Basic occurrence information
        occurrence.add_headline("Four-engine aircraft - dual engine failure during cruise")
        occurrence.add_location_name("Over Pacific Ocean")
        occurrence.add_utc_date("2024-09-25")
        occurrence.add_utc_time("03:20:00")
        occurrence.add_latitude_of_occ(35.5)
        occurrence.add_longitude_of_occ(-150.2)
        occurrence.add_occurrence_category(1)

        # Weather conditions
        occurrence.add_wx_conditions(1) # VMC
        occurrence.add_air_temperature(-45.0)
        occurrence.add_wind_speed(35.0)
        occurrence.add_wind_direction(280)

        # Aircraft information with multiple engines
        occurrence.add_aircraft do |aircraft|
          aircraft.add_aircraft_registration("N747XX")
          aircraft.add_year_built(2010)
          aircraft.add_maximum_t_o_mass(412775)
          aircraft.add_number_of_engines(4)
          aircraft.add_flight_phase(5) # Cruise
          aircraft.add_total_number_of_persons(350)

          # Engine 1 - Normal operation
          aircraft.add_engine do |engine|
            engine.add_engine_position(1) # Left outer
            engine.add_engine_serial_number("ENG-10001")
            engine.add_time_since_new(25000.0)
            engine.add_cycles_since_new(8500)
          end

          # Engine 2 - Failed
          aircraft.add_engine do |engine|
            engine.add_engine_position(2) # Left inner
            engine.add_engine_serial_number("ENG-10002")
            engine.add_time_since_new(28000.0)
            engine.add_cycles_since_new(9200)
            engine.add_hazard_eng_effect(1) # Engine failure
            engine.add_nature_of_engine_involvement(1)
          end

          # Engine 3 - Failed
          aircraft.add_engine do |engine|
            engine.add_engine_position(3) # Right inner
            engine.add_engine_serial_number("ENG-10003")
            engine.add_time_since_new(26500.0)
            engine.add_cycles_since_new(8800)
            engine.add_hazard_eng_effect(1) # Engine failure
            engine.add_nature_of_engine_involvement(1)
          end

          # Engine 4 - Normal operation
          aircraft.add_engine do |engine|
            engine.add_engine_position(4) # Right outer
            engine.add_engine_serial_number("ENG-10004")
            engine.add_time_since_new(24000.0)
            engine.add_cycles_since_new(8100)
          end

          # Captain
          aircraft.add_flight_crew_member do |crew|
            crew.add_flight_crew_licenses do |license|
              license.add_license_type(100) # Valid enum value
            end
          end

          # First Officer
          aircraft.add_flight_crew_member do |crew|
            crew.add_flight_crew_licenses do |license|
              license.add_license_type(101) # Valid enum value
            end
          end

          # Flight Engineer
          aircraft.add_flight_crew_member do |crew|
            crew.add_flight_crew_licenses do |license|
              license.add_license_type(102) # Valid enum value
            end
          end
        end

        # Narrative
        narrative_text = "During cruise at FL390 over the Pacific Ocean, the crew experienced " \
          "a sudden loss of thrust on engine 2 (left inner). The crew executed the engine " \
          "failure checklist and shut down the engine. Approximately 15 minutes later, " \
          "engine 3 (right inner) also experienced a loss of thrust and was shut down. " \
          "The aircraft continued on two engines (1 and 4) and declared an emergency. " \
          "The crew diverted to the nearest suitable airport and landed safely with no injuries. " \
          "Investigation revealed that both failed engines had ingested volcanic ash from " \
          "an unreported volcanic eruption, causing damage to the high-pressure turbine sections."

        occurrence.add_narrative do |narrative|
          narrative.add_narrative_text(narrative_text)
          narrative.add_narrative_language(1)
        end
      end

      # Validate the set
      expect(set.valid?).to be(true), "Report should be valid. Errors: #{set.validate.join(", ")}"

      # Check XML structure
      xml = set.to_xml
      expect(xml).to include("Four-engine aircraft")
      expect(xml).to include("N747XX")
      expect(xml).to include("ENG-10001")
      expect(xml).to include("ENG-10002")
      expect(xml).to include("ENG-10003")
      expect(xml).to include("ENG-10004")
      expect(xml).to include("volcanic ash")

      # Verify multiple engines are present in XML
      # Count Engine entity tags (opening tags with entityId attribute)
      engine_count = xml.scan(/<Engine entityId="13"/).length
      expect(engine_count).to eq(4), "Expected 4 engines in XML, found #{engine_count}"

      # Verify multiple crew members are present in XML
      crew_count = xml.scan(/<Flight_Crew_Member entityId="17"/).length
      expect(crew_count).to eq(3), "Expected 3 crew members in XML, found #{crew_count}"
    end
  end
end
