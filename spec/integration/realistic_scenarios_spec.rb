# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Realistic ECCAIRS XML Generation Scenarios" do
  describe "Scenario 1: Bird Strike During Takeoff" do
    it "generates a valid ECCAIRS set for a bird strike incident" do
      set = Eccairs.set

      # Basic occurrence information
      set.add_entity(Eccairs::Occurrence::Attributes::Headline.new("Bird strike during takeoff roll"))
      set.add_entity(Eccairs::Occurrence::Attributes::LocationName.new("John F. Kennedy International Airport"))
      set.add_entity(Eccairs::Occurrence::Attributes::UtcDate.new("2024-03-15"))
      set.add_entity(Eccairs::Occurrence::Attributes::UtcTime.new("14:30:00"))
      set.add_entity(Eccairs::Occurrence::Attributes::LocalDate.new("2024-03-15"))
      set.add_entity(Eccairs::Occurrence::Attributes::LocalTime.new("10:30:00"))
      set.add_entity(Eccairs::Occurrence::Attributes::OccurrenceCategory.new(1))

      # Weather conditions
      set.add_entity(Eccairs::Occurrence::Attributes::AirTemperature.new(18.0))
      set.add_entity(Eccairs::Occurrence::Attributes::DewPoint.new(12.0))
      set.add_entity(Eccairs::Occurrence::Attributes::WxConditions.new(1)) # VMC
      set.add_entity(Eccairs::Occurrence::Attributes::WindSpeed.new(8.0))
      set.add_entity(Eccairs::Occurrence::Attributes::WindDirection.new(270))
      set.add_entity(Eccairs::Occurrence::Attributes::Visibility.new(10000))

      # Aerodrome information
      set.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::LocationIndicator.new("1000"))
      set.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::AerodromeLatitude.new(40.6413))
      set.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::AerodromeLongitude.new(-73.7781))
      set.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::ElevationAboveMsl.new(13.0))
      set.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::AerodromeType.new(1))

      # Runway information
      set.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Runway::Attributes::RunwayIdentifier.new("04R"))
      set.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Runway::Attributes::RunwayNumber.new(4))

      # Aircraft information
      set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::AircraftCategory.new(1))
      set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::AircraftRegistration.new("N12345"))
      set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::SerialNumber.new("12345"))
      set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::YearBuilt.new(2018))
      set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::MaximumToMass.new(79000))
      set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::NumberOfEngines.new(2))
      set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::FlightPhase.new(3)) # Takeoff

      # Bird strike details
      set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::BirdsWildlifeSeen.new(1))
      set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::BirdsWildlifeStruck.new(1))
      set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::BirdSize.new(1))

      # Narrative
      narrative_text = "During takeoff roll on runway 04R, at approximately 80 knots, " \
                       "the crew observed a flock of birds crossing the runway. " \
                       "Unable to stop safely, the aircraft continued the takeoff. " \
                       "Multiple bird strikes were felt and heard. The takeoff was completed " \
                       "successfully and the aircraft returned for landing after dumping fuel. " \
                       "Post-flight inspection revealed damage to the nose cone and engine inlet."

      set.add_entity(Eccairs::Occurrence::Entities::Narrative::Attributes::NarrativeText.new(narrative_text))
      set.add_entity(Eccairs::Occurrence::Entities::Narrative::Attributes::NarrativeLanguage.new(1)) # English

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

      # Basic occurrence information
      set.add_entity(Eccairs::Occurrence::Attributes::Headline.new("Runway incursion - vehicle crossed active runway"))
      set.add_entity(Eccairs::Occurrence::Attributes::LocationName.new("London Heathrow Airport"))
      set.add_entity(Eccairs::Occurrence::Attributes::UtcDate.new("2024-06-20"))
      set.add_entity(Eccairs::Occurrence::Attributes::UtcTime.new("09:15:00"))
      set.add_entity(Eccairs::Occurrence::Attributes::LocalDate.new("2024-06-20"))
      set.add_entity(Eccairs::Occurrence::Attributes::LocalTime.new("10:15:00"))
      set.add_entity(Eccairs::Occurrence::Attributes::OccurrenceCategory.new(1))

      # Weather conditions - good visibility
      set.add_entity(Eccairs::Occurrence::Attributes::WxConditions.new(1)) # VMC
      set.add_entity(Eccairs::Occurrence::Attributes::Visibility.new(10000))
      set.add_entity(Eccairs::Occurrence::Attributes::AirTemperature.new(22.0))
      set.add_entity(Eccairs::Occurrence::Attributes::WindSpeed.new(5.0))
      set.add_entity(Eccairs::Occurrence::Attributes::WindDirection.new(90))

      # Aerodrome information
      set.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::LocationIndicator.new("1000"))
      set.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::AerodromeLatitude.new(51.4700))
      set.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::AerodromeLongitude.new(-0.4543))
      set.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::AerodromeType.new(1))
      set.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::LocationOnNearAerodrome.new(1)) # Runway

      # Runway information
      set.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Runway::Attributes::RunwayIdentifier.new("27L"))

      # Aircraft information (aircraft on approach)
      set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::AircraftCategory.new(1))
      set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::AircraftRegistration.new("G-ABCD"))
      set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::FlightPhase.new(6)) # Approach

      # Air Navigation Service information
      set.add_entity(Eccairs::Occurrence::Entities::AirNavigationService::Attributes::AnspName.new("NATS"))
      set.add_entity(Eccairs::Occurrence::Entities::AirNavigationService::Sector::Attributes::SectorName.new("Tower"))
      set.add_entity(Eccairs::Occurrence::Entities::AirNavigationService::Sector::Attributes::ServicesProvided.new(2000000))

      # Narrative
      narrative_text = "An airport maintenance vehicle crossed runway 27L without clearance " \
                       "while an aircraft was on final approach at 3 miles. The tower controller " \
                       "immediately instructed the aircraft to go around. The aircraft executed " \
                       "the go-around successfully with no damage or injuries. Investigation revealed " \
                       "a communication breakdown between ground control and the vehicle driver."

      set.add_entity(Eccairs::Occurrence::Entities::Narrative::Attributes::NarrativeText.new(narrative_text))
      set.add_entity(Eccairs::Occurrence::Entities::Narrative::Attributes::NarrativeLanguage.new(1))

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

      # Basic occurrence information
      set.add_entity(Eccairs::Occurrence::Attributes::Headline.new("Engine failure during cruise - successful emergency landing"))
      set.add_entity(Eccairs::Occurrence::Attributes::LocationName.new("Over North Atlantic"))
      set.add_entity(Eccairs::Occurrence::Attributes::UtcDate.new("2024-08-10"))
      set.add_entity(Eccairs::Occurrence::Attributes::UtcTime.new("16:45:00"))
      set.add_entity(Eccairs::Occurrence::Attributes::LatitudeOfOcc.new(45.5))
      set.add_entity(Eccairs::Occurrence::Attributes::LongitudeOfOcc.new(-30.2))
      set.add_entity(Eccairs::Occurrence::Attributes::OccurrenceCategory.new(1))

      # Weather conditions
      set.add_entity(Eccairs::Occurrence::Attributes::WxConditions.new(2)) # IMC
      set.add_entity(Eccairs::Occurrence::Attributes::AirTemperature.new(-40.0))
      set.add_entity(Eccairs::Occurrence::Attributes::WindSpeed.new(45.0))
      set.add_entity(Eccairs::Occurrence::Attributes::WindDirection.new(270))

      # Aircraft information
      set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::AircraftCategory.new(1))
      set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::AircraftRegistration.new("N98765"))
      set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::SerialNumber.new("98765"))
      set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::YearBuilt.new(2015))
      set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::MaximumToMass.new(250000))
      set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::NumberOfEngines.new(2))
      set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::FlightPhase.new(5)) # Cruise
      set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::TotalNumberOfPersons.new(189))

      # Engine information
      set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Engine::Attributes::EnginePosition.new(2)) # Right
      set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Engine::Attributes::EngineSerialNumber.new("ENG-54321"))
      set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Engine::Attributes::HazardEngEffect.new(1))

      # Narrative
      narrative_text = "During cruise at FL370, the crew experienced a sudden vibration followed by " \
                       "engine fire warnings on the right engine. The crew executed the engine fire " \
                       "checklist, shut down the right engine, and discharged both fire bottles. " \
                       "The fire warning extinguished. The crew declared an emergency and diverted " \
                       "to the nearest suitable airport. The aircraft landed safely on one engine " \
                       "with no injuries. Post-incident inspection revealed a catastrophic failure " \
                       "of a high-pressure turbine blade, resulting in significant engine damage."

      set.add_entity(Eccairs::Occurrence::Entities::Narrative::Attributes::NarrativeText.new(narrative_text))
      set.add_entity(Eccairs::Occurrence::Entities::Narrative::Attributes::NarrativeLanguage.new(1))

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
end
