# frozen_string_literal: true

require "spec_helper"

RSpec.describe "ECCAIRS Stress Tests - Pushing Limits" do
  describe "Scenario 1: Maximum Attribute Density - Every Possible Occurrence Attribute" do
    it "generates a valid ECCAIRS set with maximum occurrence-level attributes" do
      set = Eccairs.set

      set.add_occurrence do |occurrence|
        # Basic identification
        occurrence.add_headline("Comprehensive test with maximum attribute density")
        occurrence.add_location_name("Test Airport International")
        occurrence.add_utc_date("2024-11-01")
        occurrence.add_utc_time("12:00:00")
        occurrence.add_local_date("2024-11-01")
        occurrence.add_local_time("14:00:00")
        occurrence.add_occurrence_category(1)

        # Location data
        occurrence.add_latitude_of_occ(51.4775)
        occurrence.add_longitude_of_occ(-0.4614)

        # Weather attributes - comprehensive
        occurrence.add_air_temperature(15.5)
        occurrence.add_dew_point(10.2)
        occurrence.add_wx_conditions(1)
        occurrence.add_wind_speed(15.0)
        occurrence.add_wind_direction(270)
        occurrence.add_visibility(8000)
        occurrence.add_cloud_amount(4)

        # ATM contribution
        occurrence.add_atm_contribution(2) # NO

        # Authority closure
        occurrence.add_authority_occ_closure("1")

        # Aviation sector
        occurrence.add_aviation_sector("1")

        # Reporting history with corrective actions
        occurrence.add_reporting_history do |history|
          history.add_corrective_actions("Comprehensive corrective actions implemented")
        end

        # Damage not to aircraft
        occurrence.add_damage_not_to_a_c(1)

        # Narrative
        occurrence.add_narrative do |narrative|
          narrative.add_narrative_text("This is a comprehensive stress test of the ECCAIRS system.")
          narrative.add_narrative_language(1)
        end
      end

      expect(set.valid?).to be(true), "Report should be valid. Errors: #{set.validate.join(", ")}"

      xml = set.to_xml
      expect(xml).to include("Comprehensive test")
      expect(xml).to include("Air_Temperature")
      expect(xml).to include("Dew_Point")
    end
  end

  describe "Scenario 2: Multiple Aircraft in Single Occurrence" do
    it "generates a valid ECCAIRS set with multiple aircraft entities" do
      set = Eccairs.set

      # Single occurrence with multiple aircraft
      set.add_occurrence do |occurrence|
        occurrence.add_headline("Multiple aircraft involved in incident")
        occurrence.add_location_name("Airport Alpha")
        occurrence.add_utc_date("2024-11-01")
        occurrence.add_utc_time("08:00:00")
        occurrence.add_occurrence_category(1)

        # First aircraft - Bird strike
        occurrence.add_aircraft(id: "AC1") do |aircraft|
          aircraft.add_aircraft_registration("N11111")
          aircraft.add_flight_phase(6) # Approach
          aircraft.add_birds_wildlife_struck(1)
          aircraft.add_bird_size(2)
        end

        # Second aircraft - Near miss
        occurrence.add_aircraft(id: "AC2") do |aircraft|
          aircraft.add_aircraft_registration("N22222")
          aircraft.add_flight_phase(6) # Approach
        end

        # Third aircraft - Engine issue
        occurrence.add_aircraft(id: "AC3") do |aircraft|
          aircraft.add_aircraft_registration("N33333")
          aircraft.add_flight_phase(5) # Cruise
          aircraft.add_number_of_engines(2)

          aircraft.add_engine do |engine|
            engine.add_engine_position(2)
            engine.add_hazard_eng_effect(1)
          end
        end

        occurrence.add_narrative do |narrative|
          narrative.add_narrative_text("Multiple aircraft involved in complex incident.")
          narrative.add_narrative_language(1)
        end
      end

      expect(set.valid?).to be(true), "Report should be valid. Errors: #{set.validate.join(", ")}"

      xml = set.to_xml
      expect(xml).to include("N11111")
      expect(xml).to include("N22222")
      expect(xml).to include("N33333")
    end
  end

  describe "Scenario 3: Complex Runway Incursion with Multiple Entities" do
    it "generates a valid ECCAIRS set for a complex runway incursion scenario" do
      set = Eccairs.set

      set.add_occurrence do |occurrence|
        occurrence.add_headline("Complex runway incursion - multiple aircraft and vehicles")
        occurrence.add_location_name("Busy International Airport")
        occurrence.add_utc_date("2024-11-02")
        occurrence.add_utc_time("16:30:00")
        occurrence.add_local_date("2024-11-02")
        occurrence.add_local_time("17:30:00")
        occurrence.add_occurrence_category(1)

        # Weather - low visibility
        occurrence.add_air_temperature(8.0)
        occurrence.add_wx_conditions(2) # IMC
        occurrence.add_visibility(400) # Low visibility
        occurrence.add_wind_speed(5.0)
        occurrence.add_wind_direction(90)

        # Aerodrome with multiple runways
        occurrence.add_aerodrome_general do |aerodrome|
          aerodrome.add_location_indicator("1000")
          aerodrome.add_aerodrome_latitude(51.4700)
          aerodrome.add_aerodrome_longitude(-0.4543)
          aerodrome.add_aerodrome_type(1)
          aerodrome.add_location_on_near_aerodrome(1) # Runway

          aerodrome.add_runway(id: "RWY1") do |runway|
            runway.add_runway_identifier("27L")
            runway.add_runway_number(27)
            runway.add_surface_type(1)
          end

          aerodrome.add_runway(id: "RWY2") do |runway|
            runway.add_runway_identifier("27R")
            runway.add_runway_number(27)
            runway.add_surface_type(1)
          end
        end

        # Aircraft 1 - Landing
        occurrence.add_aircraft(id: "AC1") do |aircraft|
          aircraft.add_aircraft_registration("G-LAND")
          aircraft.add_flight_phase(7) # Landing
          aircraft.add_aircraft_category(1)
          aircraft.add_total_number_of_persons(180)
        end

        # Aircraft 2 - Taxiing (incursion aircraft)
        occurrence.add_aircraft(id: "AC2") do |aircraft|
          aircraft.add_aircraft_registration("G-TAXI")
          aircraft.add_flight_phase(8) # Taxi (8 is valid)
          aircraft.add_aircraft_category(1)
          aircraft.add_total_number_of_persons(150)
        end

        # Aircraft 3 - Holding short
        occurrence.add_aircraft(id: "AC3") do |aircraft|
          aircraft.add_aircraft_registration("G-HOLD")
          aircraft.add_flight_phase(8) # Taxi (8 is valid)
          aircraft.add_aircraft_category(1)
          aircraft.add_total_number_of_persons(120)
        end

        # Runway incursion details
        occurrence.add_runway_incursion do |ri|
          ri.add_entity_involved("1") # Aircraft
        end

        # Air Navigation Service
        occurrence.add_air_navigation_service do |ans|
          ans.add_ansp_name("Airport Tower")
          ans.add_rimcas_alerting(1) # RIMCAS alert triggered

          ans.add_sector(id: "SEC1") do |sector|
            sector.add_sector_name("Tower")
            sector.add_services_provided(2000000)

            # Multiple ATM staff
            sector.add_atm_staff do |staff|
              staff.add_category(1) # Tower controller
              staff.add_duty_time_in_position(1.5)
            end

            sector.add_atm_staff do |staff|
              staff.add_category(2) # Ground controller
              staff.add_duty_time_in_position(2.0)
            end
          end
        end

        # Risk assessment
        occurrence.add_risk_assessment do |risk|
          risk.add_risk_level(4) # Major
          risk.add_risk_grade(2) # B
          risk.add_risk_method(1)
        end

        narrative_text = <<~NARRATIVE.strip
          During low visibility operations (400m visibility, IMC conditions), a complex runway
          incursion occurred at Busy International Airport involving three aircraft and three
          ground vehicles.

          Aircraft G-LAND was on final approach to runway 27L with 180 passengers on board.
          Aircraft G-TAXI, with 150 passengers, was taxiing from the terminal to runway 27R
          for departure. Aircraft G-HOLD, with 120 passengers, was holding short of runway 27L.

          Due to a miscommunication between tower and ground control, G-TAXI was inadvertently
          cleared to cross runway 27L while G-LAND was on short final. The RIMCAS (Runway
          Incursion Monitoring and Collision Avoidance System) triggered an alert.

          The tower controller immediately instructed G-LAND to go around. The aircraft
          executed the go-around at 200 feet AGL, passing approximately 500 meters ahead of
          G-TAXI which was crossing the runway.

          No collision occurred and no injuries were sustained. However, the incident was
          classified as a serious runway incursion (Category A) due to the close proximity
          and the number of persons at risk (450 total across all three aircraft).

          Contributing factors: low visibility conditions, high traffic density, communication
          breakdown between tower and ground control, and inadequate readback verification.
          The RIMCAS system functioned correctly and was instrumental in preventing a collision.
        NARRATIVE

        occurrence.add_narrative do |narrative|
          narrative.add_narrative_text(narrative_text)
          narrative.add_narrative_language(1)
        end
      end

      expect(set.valid?).to be(true), "Report should be valid. Errors: #{set.validate.join(", ")}"

      xml = set.to_xml
      expect(xml).to include("Complex runway incursion")
      expect(xml).to include("G-LAND")
      expect(xml).to include("G-TAXI")
      expect(xml).to include("G-HOLD")
      expect(xml).to include("Runway_Incursion")
      expect(xml).to include("RIMCAS")
    end
  end
end
