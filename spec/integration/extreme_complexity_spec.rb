# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Extreme Complexity ECCAIRS XML Generation Tests" do
  describe "Scenario 1: Maximum Nesting Complexity - Multi-Aircraft Mid-Air Collision with Casualties" do
    it "generates a valid ECCAIRS set with deeply nested entities and multiple aircraft" do
      set = Eccairs.set

      set.add_occurrence do |occurrence|
        # Basic occurrence information
        occurrence.add_headline("Mid-air collision between commercial and private aircraft with multiple casualties")
        occurrence.add_location_name("Near Denver International Airport")
        occurrence.add_utc_date("2024-09-15")
        occurrence.add_utc_time("18:45:30")
        occurrence.add_local_date("2024-09-15")
        occurrence.add_local_time("12:45:30")
        occurrence.add_occurrence_category(1)
        occurrence.add_latitude_of_occ(39.8561)
        occurrence.add_longitude_of_occ(-104.6737)

        # Weather conditions
        occurrence.add_air_temperature(22.5)
        occurrence.add_dew_point(8.3)
        occurrence.add_wx_conditions(1) # VMC
        occurrence.add_wind_speed(12.0)
        occurrence.add_wind_direction(180)
        occurrence.add_visibility(15000)
        occurrence.add_cloud_amount(3) # Scattered

        # Add precipitation and weather phenomena
        occurrence.add_precipitation_and_other_weather_phenomena do |weather|
          weather.add_phenomenon_intensity(2) # Moderate
          weather.add_phenomenon_type(1)
        end

        # Aerodrome information
        occurrence.add_aerodrome_general do |aerodrome|
          aerodrome.add_location_indicator("1000")
          aerodrome.add_aerodrome_latitude(39.8561)
          aerodrome.add_aerodrome_longitude(-104.6737)
          aerodrome.add_elevation_above_msl(1655.0)
          aerodrome.add_aerodrome_type(1)
          aerodrome.add_aerodrome_status(1)

          # Multiple runways
          aerodrome.add_runway(id: "RWY1") do |runway|
            runway.add_runway_identifier("16R")
            runway.add_runway_number(16)
            runway.add_surface_type(1)
          end

          aerodrome.add_runway(id: "RWY2") do |runway|
            runway.add_runway_identifier("17L")
            runway.add_runway_number(17)
            runway.add_surface_type(1)
          end
        end

        # First Aircraft - Commercial Jet
        occurrence.add_aircraft(id: "AC1") do |aircraft|
          aircraft.add_aircraft_registration("N12345")
          aircraft.add_year_built(2015)
          aircraft.add_maximum_t_o_mass(79000)
          aircraft.add_number_of_engines(2)
          aircraft.add_flight_phase(5) # Cruise
          aircraft.add_total_number_of_persons(156)
          aircraft.add_aircraft_altitude(8500)
          aircraft.add_aircraft_category(1)
          aircraft.add_total_cycles_a_c(12500)
          aircraft.add_aircraft_total_time(25000.5)

          # Multiple engines with detailed information
          aircraft.add_engine do |engine|
            engine.add_engine_position(1) # Left
            engine.add_engine_serial_number("ENG-LEFT-001")
            engine.add_cycles_since_new(12500)
            engine.add_cycles_since_overhaul(2500)
          end

          aircraft.add_engine do |engine|
            engine.add_engine_position(2) # Right
            engine.add_engine_serial_number("ENG-RIGHT-002")
            engine.add_cycles_since_new(12500)
            engine.add_cycles_since_overhaul(2500)
          end

          # Flight crew member with licenses and incapacitation
          aircraft.add_flight_crew_member do |crew|
            crew.add_category(1) # Captain
            crew.add_experience_all_a_c(8500.0)
            crew.add_experience_this_a_c(2500.0)
            crew.add_duty_last_24_hours(6.5)
            crew.add_rest_before_duty(12.0)

            crew.add_flight_crew_licenses do |license|
              license.add_validity(1) # Valid
            end
          end

          # Second crew member
          aircraft.add_flight_crew_member do |crew|
            crew.add_category(2) # First Officer
            crew.add_experience_all_a_c(3500.0)
            crew.add_experience_this_a_c(1200.0)
            crew.add_duty_last_24_hours(6.5)
            crew.add_rest_before_duty(12.0)

            crew.add_flight_crew_licenses do |license|
              license.add_validity(1) # Valid
            end
          end

          # Incapacitation due to collision
          aircraft.add_incapacitation do |incap|
            incap.add_person_incapacitated(1)
          end
        end

        # Second Aircraft - Private Aircraft
        occurrence.add_aircraft(id: "AC2") do |aircraft|
          aircraft.add_aircraft_registration("N98765")
          aircraft.add_year_built(2008)
          aircraft.add_maximum_t_o_mass(2500)
          aircraft.add_number_of_engines(1)
          aircraft.add_flight_phase(5) # Cruise
          aircraft.add_total_number_of_persons(4)
          aircraft.add_aircraft_altitude(8500)
          aircraft.add_aircraft_category(2)
          aircraft.add_total_cycles_a_c(5600)
          aircraft.add_aircraft_total_time(8900.0)

          # Single engine
          aircraft.add_engine do |engine|
            engine.add_engine_position(3) # Center
            engine.add_engine_serial_number("ENG-CENTER-003")
            engine.add_cycles_since_new(5600)
          end

          # Propeller
          aircraft.add_propeller do |prop|
            prop.add_cycles_since_overh(5600)
          end

          # Pilot
          aircraft.add_flight_crew_member do |crew|
            crew.add_category(1) # Pilot
            crew.add_experience_all_a_c(450.0)
            crew.add_experience_this_a_c(120.0)

            crew.add_flight_crew_licenses do |license|
              license.add_validity(1) # Valid
            end
          end

          # Multiple incapacitations
          aircraft.add_incapacitation do |incap|
            incap.add_person_incapacitated(1)
          end

          aircraft.add_incapacitation do |incap|
            incap.add_person_incapacitated(2)
          end
        end

        # Airspace information
        occurrence.add_air_space(id: "AS1") do |airspace|
          airspace.add_airspace_class(1)
          airspace.add_airspace_name("Denver Class B Airspace")
          airspace.add_airspace_type(1)
        end

        # Air Navigation Service
        occurrence.add_air_navigation_service do |ans|
          ans.add_ansp_name("FAA Denver TRACON")
          ans.add_stca_current_alerting(1)

          ans.add_sector(id: "SEC1") do |sector|
            sector.add_sector_name("Denver Approach")
            sector.add_services_provided(2000000)

            # ATM Staff
            sector.add_atm_staff do |staff|
              staff.add_category(1)
              staff.add_duty_time_in_position(2.5)
              staff.add_cism_offered(1)
            end
          end
        end

        # Separation details
        occurrence.add_separation do |sep|
          sep.add_est_minimum_horiz_sep(0.1) # 0.1 NM
          sep.add_est_vert_separation(50) # 50 feet
          sep.add_req_minimum_horiz_sep(3.0) # Required 3 NM
          sep.add_req_vert_separation(1000) # Required 1000 feet
          sep.add_horizontal_rel_mvmt(1)
          sep.add_rate_of_closure(250)

          # Separation aircraft details
          sep.add_separation_aircraft do |sep_ac|
            sep_ac.add_separation_traffic_info_type_quality do |traffic|
              traffic.add_traffic_info_quality(1)
            end
          end
        end

        # Events
        occurrence.add_events(id: "EVT1") do |event|
          event.add_event_type("3000000") # Valid ECCAIRS event type code
          event.add_phase("50000") # Valid ECCAIRS phase code - Cruise
        end

        # Risk Assessment
        occurrence.add_risk_assessment do |risk|
          risk.add_risk_level(5) # Catastrophic
          risk.add_risk_grade(1) # A
          risk.add_risk_method(1)
          risk.add_key_risk_area(1)
        end

        # Comprehensive narrative
        narrative_text = <<~NARRATIVE.strip
          At approximately 12:45 local time, a mid-air collision occurred between a commercial
          Boeing 737 (N12345) and a Cessna 172 (N98765) at 8,500 feet MSL, approximately 15 miles
          northeast of Denver International Airport. The commercial aircraft was on a visual approach
          to runway 16R with 156 persons on board, while the private aircraft was conducting a
          cross-country flight with 4 persons on board.

          Weather conditions were VMC with scattered clouds, visibility 15km, winds 180 at 12 knots.
          Both aircraft were in contact with Denver Approach Control. The controller had issued
          traffic advisories to both aircraft, but the closure rate of approximately 250 knots
          resulted in insufficient time for evasive action.

          The collision resulted in catastrophic damage to both aircraft. The Cessna's right wing
          struck the Boeing's left horizontal stabilizer. Both aircraft lost control and crashed
          in open terrain. There were no survivors from either aircraft.

          Investigation revealed that the private aircraft had deviated from its assigned altitude
          of 7,500 feet and climbed to 8,500 feet without clearance, entering the path of the
          commercial aircraft. The TCAS system on the commercial aircraft generated a resolution
          advisory, but the collision occurred before evasive maneuvers could be completed.

          Contributing factors included: inadequate altitude monitoring by the private pilot,
          high workload in the approach sector, and limitations in the controller's ability to
          detect the altitude deviation in time to prevent the collision.
        NARRATIVE

        occurrence.add_narrative do |narrative|
          narrative.add_narrative_text(narrative_text)
          narrative.add_narrative_language(1) # English
        end
      end

      # Validate the set
      expect(set.valid?).to be(true), "Report should be valid. Errors: #{set.validate.join(", ")}"

      # Check XML structure
      xml = set.to_xml
      expect(xml).to include("Mid-air collision")
      expect(xml).to include("N12345")
      expect(xml).to include("N98765")
      expect(xml).to include("Denver")
      expect(xml).to include("ENG-LEFT-001")
      expect(xml).to include("ENG-RIGHT-002")
      expect(xml).to include("ENG-CENTER-003")
      expect(xml).to include("Incapacitation")
      expect(xml).to include("Separation")
      expect(xml).to include("Risk_Assessment")
    end
  end

  describe "Scenario 2: Dangerous Goods Incident with Multiple Packages and Ground Handling" do
    it "generates a valid ECCAIRS set for a complex dangerous goods incident" do
      set = Eccairs.set

      set.add_occurrence do |occurrence|
        occurrence.add_headline("Dangerous goods leak during ground handling operations")
        occurrence.add_location_name("Frankfurt Airport")
        occurrence.add_utc_date("2024-10-05")
        occurrence.add_utc_time("14:22:00")
        occurrence.add_local_date("2024-10-05")
        occurrence.add_local_time("16:22:00")
        occurrence.add_occurrence_category(1)

        # Weather
        occurrence.add_air_temperature(18.0)
        occurrence.add_wx_conditions(1)
        occurrence.add_wind_speed(8.0)
        occurrence.add_wind_direction(270)

        # Aerodrome
        occurrence.add_aerodrome_general do |aerodrome|
          aerodrome.add_location_indicator("1000")
          aerodrome.add_aerodrome_latitude(50.0379)
          aerodrome.add_aerodrome_longitude(8.5622)
          aerodrome.add_aerodrome_type(1)
          aerodrome.add_location_on_near_aerodrome(5) # Apron
        end

        # Aircraft
        occurrence.add_aircraft(id: "AC1") do |aircraft|
          aircraft.add_aircraft_registration("D-ABCD")
          aircraft.add_flight_phase(1) # Parked
          aircraft.add_aircraft_category(1)
        end

        # Multiple dangerous goods packages
        occurrence.add_dangerous_goods(id: "DG1") do |dg|
          dg.add_dangerous_good("1203") # Gasoline - Class 3 Flammable liquid
          dg.add_air_waybill_consignment_tracking_number("AWB-123456789")
          dg.add_shipper_name("Chemical Transport GmbH")
          dg.add_origin_of_goods("Hamburg, Germany")
          dg.add_total_number_of_packages_in_consignment(50)
          dg.add_number_of_inner_packages(200)
          dg.add_quantity_per_inner_packaging(2) # Integer, not float
          dg.add_type_of_outer_packaging(1)
          dg.add_type_of_inner_packaging(2)
          dg.add_subsidiary_risk(1)
          dg.add_packing_group_class_7_category(1)
        end

        occurrence.add_dangerous_goods(id: "DG2") do |dg|
          dg.add_dangerous_good("1230") # Methanol - Class 3 Flammable liquid
          dg.add_air_waybill_consignment_tracking_number("AWB-987654321")
          dg.add_shipper_name("Industrial Chemicals Ltd")
          dg.add_origin_of_goods("Rotterdam, Netherlands")
          dg.add_total_number_of_packages_in_consignment(30)
          dg.add_number_of_inner_packages(120)
          dg.add_quantity_per_inner_packaging(5) # Integer, not float
          dg.add_type_of_outer_packaging(2)
          dg.add_type_of_inner_packaging(1)
        end

        occurrence.add_dangerous_goods(id: "DG3") do |dg|
          dg.add_dangerous_good("1789") # Hydrochloric acid - Class 8 Corrosive
          dg.add_air_waybill_consignment_tracking_number("AWB-555666777")
          dg.add_shipper_name("Acid Solutions SA")
          dg.add_origin_of_goods("Lyon, France")
          dg.add_total_number_of_packages_in_consignment(20)
          dg.add_number_of_inner_packages(80)
          dg.add_quantity_per_inner_packaging(1) # Integer, not float
          dg.add_type_of_outer_packaging(3)
          dg.add_type_of_inner_packaging(3)
          dg.add_subsidiary_risk(2)
        end

        # Ground handling
        occurrence.add_ground_handling do |gh|
          gh.add_gh_organisation(1) # Ground handling organization
          gh.add_gh_type_of_service(1)
          gh.add_type_of_equipment_involved(1) # Cargo loader
        end

        # Risk assessment
        occurrence.add_risk_assessment do |risk|
          risk.add_risk_level(4) # Major
          risk.add_risk_grade(2) # B
          risk.add_risk_method(1)
          risk.add_key_risk_area(2)
        end

        narrative_text = <<~NARRATIVE.strip
          During ground handling operations at Frankfurt Airport, a dangerous goods leak was
          discovered in the cargo hold of aircraft D-ABCD. The aircraft was parked at the cargo
          apron and was being loaded with three separate dangerous goods consignments.

          The first consignment (AWB-123456789) contained 50 packages of explosives from Chemical
          Transport GmbH, originating from Hamburg. The second consignment (AWB-987654321) contained
          30 packages of flammable liquids from Industrial Chemicals Ltd, originating from Rotterdam.
          The third consignment (AWB-555666777) contained 20 packages of corrosive substances from
          Acid Solutions SA, originating from Lyon.

          Ground handling personnel noticed a strong chemical odor and visible liquid leaking
          from one of the packages in the flammable liquids consignment. The loading operation
          was immediately halted, and emergency procedures were activated.

          The airport fire service responded within 3 minutes. The affected area was evacuated,
          and specialized hazmat teams were deployed. The leaking package was identified and
          isolated. Investigation revealed that the inner packaging had failed due to improper
          securing during transport, causing the outer packaging to be compromised.

          No injuries occurred, but the incident resulted in a 4-hour closure of the cargo apron
          and significant delays to cargo operations. All three dangerous goods consignments were
          offloaded and inspected. Two additional packages showed signs of damage but had not leaked.

          Contributing factors: inadequate packaging inspection at origin, rough handling during
          transport to the airport, and insufficient training of ground handling personnel in
          dangerous goods recognition.
        NARRATIVE

        occurrence.add_narrative do |narrative|
          narrative.add_narrative_text(narrative_text)
          narrative.add_narrative_language(1)
        end
      end

      errors = set.validate
      if errors.any?
        puts "\n\nValidation Errors:"
        errors.each { |e| puts e }
        puts "\n\n"
      end
      expect(set.valid?).to be(true), "Report should be valid. Errors: #{errors.join("\n")}"

      xml = set.to_xml
      expect(xml).to include("Dangerous_Goods")
      expect(xml).to include("AWB-123456789")
      expect(xml).to include("AWB-987654321")
      expect(xml).to include("AWB-555666777")
      expect(xml).to include("Ground_Handling")
      expect(xml).to include("Type_Of_Equipment_Involved")
    end
  end
end
