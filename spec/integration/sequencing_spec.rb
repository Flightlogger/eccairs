# frozen_string_literal: true

require "spec_helper"

RSpec.describe "ECCAIRS Sequencing Tests - Attribute Order Independence" do
  describe "Scenario 1: Reverse Order Attribute Addition" do
    it "generates valid XML regardless of attribute addition order" do
      set = Eccairs.set

      set.add_occurrence do |occurrence|
        # Add attributes in reverse alphabetical/sequence order
        # This tests that the XML builder properly sequences them
        occurrence.add_wx_conditions(1)
        occurrence.add_wind_speed(15.0)
        occurrence.add_wind_direction(270)
        occurrence.add_visibility(8000)
        occurrence.add_utc_time("14:30:00")
        occurrence.add_utc_date("2024-11-15")
        occurrence.add_occurrence_category(1)
        occurrence.add_longitude_of_occ(-0.4614)
        occurrence.add_location_name("Test Airport")
        occurrence.add_local_time("15:30:00")
        occurrence.add_local_date("2024-11-15")
        occurrence.add_latitude_of_occ(51.4775)
        occurrence.add_headline("Reverse order test")
        occurrence.add_dew_point(10.2)
        occurrence.add_cloud_amount(4)
        occurrence.add_air_temperature(15.5)
      end

      expect(set.valid?).to be(true), "Report should be valid. Errors: #{set.validate.join(", ")}"

      xml = set.to_xml
      # Verify all attributes are present
      expect(xml).to include("Headline")
      expect(xml).to include("Air_Temperature")
      expect(xml).to include("Wind_Speed")
      expect(xml).to include("UTC_Date")
    end
  end

  describe "Scenario 2: Random Order with Nested Entities" do
    it "generates valid XML with entities and attributes added in random order" do
      set = Eccairs.set

      set.add_occurrence do |occurrence|
        # Add narrative first (usually added last)
        occurrence.add_narrative do |narrative|
          narrative.add_narrative_text("This narrative was added first")
          narrative.add_narrative_language(1)
        end

        # Add some attributes
        occurrence.add_headline("Random order with entities")
        occurrence.add_occurrence_category(1)

        # Add aircraft in the middle
        occurrence.add_aircraft(id: "AC1") do |aircraft|
          aircraft.add_flight_phase(5) # Cruise
          aircraft.add_aircraft_registration("N12345")
          aircraft.add_aircraft_category(1)
        end

        # Add more attributes after entities
        occurrence.add_utc_date("2024-11-15")
        occurrence.add_utc_time("14:30:00")
        occurrence.add_local_date("2024-11-15")
        occurrence.add_local_time("15:30:00")
        occurrence.add_location_name("Random Order Airport")

        # Add another entity
        occurrence.add_aerodrome_general do |aerodrome|
          aerodrome.add_location_indicator("1000")
          aerodrome.add_aerodrome_type(1)
        end

        # Add final attributes
        occurrence.add_latitude_of_occ(51.4775)
        occurrence.add_longitude_of_occ(-0.4614)
      end

      expect(set.valid?).to be(true), "Report should be valid. Errors: #{set.validate.join(", ")}"

      xml = set.to_xml
      # Verify structure is correct despite random order
      expect(xml).to include("<ATTRIBUTES>")
      expect(xml).to include("<ENTITIES>")
      expect(xml).to include("Narrative")
      expect(xml).to include("Aircraft")
      expect(xml).to include("Aerodrome_General")
    end
  end

  describe "Scenario 3: Deeply Nested Entities Added in Reverse" do
    it "generates valid XML with deeply nested entities added in reverse order" do
      set = Eccairs.set

      set.add_occurrence do |occurrence|
        occurrence.add_headline("Deep nesting reverse order")
        occurrence.add_utc_date("2024-11-15")
        occurrence.add_utc_time("14:30:00")
        occurrence.add_local_date("2024-11-15")
        occurrence.add_local_time("15:30:00")
        occurrence.add_occurrence_category(1)
        occurrence.add_location_name("Deep Nesting Airport")

        # Add aircraft with nested entities in reverse order
        occurrence.add_aircraft(id: "AC1") do |aircraft|
          # Add nested entities first
          aircraft.add_engine do |engine|
            # Add engine attributes in reverse
            engine.add_engine_serial_number("SN-999888")
            engine.add_engine_position(1)
            engine.add_cycles_since_new(5000)
          end

          aircraft.add_propeller do |propeller|
            propeller.add_cycles_since_overh(3000)
            propeller.add_time_since_overhaul(2500.0)
          end

          aircraft.add_flight_crew_member do |crew|
            crew.add_experience_all_a_c(5000.0)
            crew.add_experience_this_a_c(1000.0)
          end

          # Add aircraft attributes last (reverse of typical order)
          aircraft.add_year_built(2015)
          aircraft.add_flight_phase(5)
          aircraft.add_aircraft_registration("N12345")
          aircraft.add_aircraft_category(1)
        end

        # Add aerodrome with nested entities
        occurrence.add_aerodrome_general do |aerodrome|
          # Add nested runway first
          aerodrome.add_runway(id: "RW1") do |runway|
            runway.add_runway_identifier("09L")
          end

          # Add aerodrome attributes after
          aerodrome.add_location_indicator("1000")
          aerodrome.add_aerodrome_type(1)
        end
      end

      expect(set.valid?).to be(true), "Report should be valid. Errors: #{set.validate.join(", ")}"

      xml = set.to_xml
      expect(xml).to include("Engine")
      expect(xml).to include("Propeller")
      expect(xml).to include("Flight_Crew_Member")
      expect(xml).to include("Runway")
    end
  end

  describe "Scenario 4: Interleaved Attributes and Entities" do
    it "generates valid XML with heavily interleaved attributes and entities" do
      set = Eccairs.set

      set.add_occurrence do |occurrence|
        occurrence.add_headline("Interleaved test")

        occurrence.add_aircraft(id: "AC1") do |aircraft|
          aircraft.add_aircraft_registration("N11111")
          aircraft.add_aircraft_category(1)
        end

        occurrence.add_utc_date("2024-11-15")

        occurrence.add_aircraft(id: "AC2") do |aircraft|
          aircraft.add_aircraft_registration("N22222")
          aircraft.add_aircraft_category(1)
        end

        occurrence.add_utc_time("14:30:00")

        occurrence.add_events(id: "EV1") do |event|
          event.add_event_type("1000000") # Generic event type
        end

        occurrence.add_local_date("2024-11-15")

        occurrence.add_events(id: "EV2") do |event|
          event.add_event_type("2000000") # Another generic event type
        end

        occurrence.add_local_time("15:30:00")
        occurrence.add_occurrence_category(1)

        occurrence.add_narrative do |narrative|
          narrative.add_narrative_text("Heavily interleaved")
          narrative.add_narrative_language(1)
        end

        occurrence.add_location_name("Interleaved Airport")
        occurrence.add_latitude_of_occ(51.4775)
        occurrence.add_longitude_of_occ(-0.4614)
      end

      errors = set.validate
      if errors.any?
        puts "\n\nValidation Errors:"
        errors.each { |e| puts e }
        puts "\n\n"
      end
      expect(set.valid?).to be(true), "Report should be valid. Errors: #{errors.join("\n")}"

      xml = set.to_xml

      # Verify all entities are present
      expect(xml).to include('<Aircraft entityId="4"')
      expect(xml).to include("N11111")
      expect(xml).to include("N22222")
      expect(xml).to include('<Events entityId="14"')
      expect(xml).to include("1000000")
      expect(xml).to include("2000000")
      expect(xml).to include("Narrative")

      # Verify attributes section comes before entities section
      attributes_index = xml.index("<ATTRIBUTES>")
      entities_index = xml.index("<ENTITIES>")
      expect(attributes_index).to be < entities_index
    end
  end

  describe "Scenario 5: Multiple Same-Type Entities in Random Order" do
    it "generates valid XML with multiple same-type entities added non-sequentially" do
      set = Eccairs.set

      set.add_occurrence do |occurrence|
        occurrence.add_headline("Multiple entities random order")
        occurrence.add_utc_date("2024-11-15")
        occurrence.add_utc_time("14:30:00")
        occurrence.add_local_date("2024-11-15")
        occurrence.add_local_time("15:30:00")
        occurrence.add_occurrence_category(1)
        occurrence.add_location_name("Multi-Entity Airport")

        # Add aircraft in non-sequential order with attributes between
        occurrence.add_aircraft(id: "AC3") do |aircraft|
          aircraft.add_aircraft_registration("N33333")
          aircraft.add_aircraft_category(1)
          aircraft.add_flight_phase(3)
        end

        occurrence.add_latitude_of_occ(51.4775)

        occurrence.add_aircraft(id: "AC1") do |aircraft|
          aircraft.add_aircraft_registration("N11111")
          aircraft.add_aircraft_category(1)
          aircraft.add_flight_phase(1)
        end

        occurrence.add_longitude_of_occ(-0.4614)

        occurrence.add_aircraft(id: "AC2") do |aircraft|
          aircraft.add_aircraft_registration("N22222")
          aircraft.add_aircraft_category(1)
          aircraft.add_flight_phase(2)
        end

        occurrence.add_air_temperature(15.5)

        # Add events in random order
        occurrence.add_events(id: "EV2") do |event|
          event.add_event_type("2000000") # Generic event type
        end

        occurrence.add_wind_speed(10.0)

        occurrence.add_events(id: "EV1") do |event|
          event.add_event_type("1000000") # Generic event type
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

      # All entities should be present - check by registration/event type instead of ID
      expect(xml).to include("N11111")
      expect(xml).to include("N22222")
      expect(xml).to include("N33333")
      expect(xml).to include("1000000")
      expect(xml).to include("2000000")
    end
  end
end
