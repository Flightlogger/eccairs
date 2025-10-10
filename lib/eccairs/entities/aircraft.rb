# frozen_string_literal: true

module Eccairs
  module Entities
    class Aircraft < Eccairs::Base::Entity
      entity_id "4"
      xml_tag "Aircraft"
      requires_id

      # Add aircraft altitude
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::AircraftAltitude] The created attribute instance
      # @note Attribute ID: 22, XML Tag: Aircraft_Altitude
      def add_aircraft_altitude(value)
        add_attribute(Eccairs::Attributes::AircraftAltitude, false, value)
      end

      # Add aircraft category
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::AircraftCategory] The created attribute instance
      # @note Attribute ID: 32, XML Tag: Aircraft_Category
      def add_aircraft_category(value)
        add_attribute(Eccairs::Attributes::AircraftCategory, false, value)
      end

      # Add a c flight level
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::ACFlightLevel] The created attribute instance
      # @note Attribute ID: 25, XML Tag: A_C_Flight_Level
      def add_a_c_flight_level(value)
        add_attribute(Eccairs::Attributes::ACFlightLevel, false, value)
      end

      # Add aircraft registration
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::AircraftRegistration] The created attribute instance
      # @note Attribute ID: 244, XML Tag: Aircraft_Registration
      def add_aircraft_registration(value)
        add_attribute(Eccairs::Attributes::AircraftRegistration, false, value)
      end

      # Add aircraft total time
      # @param value [String] The attribute value
      # @return [Eccairs::Attributes::AircraftTotalTime] The created attribute instance
      # @note Attribute ID: 291, XML Tag: Aircraft_Total_Time
      def add_aircraft_total_time(value)
        add_attribute(Eccairs::Attributes::AircraftTotalTime, false, value)
      end

      # Add annex 2 a c type
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::Annex2ACType] The created attribute instance
      # @note Attribute ID: 1090, XML Tag: Annex_2_A_C_Type
      def add_annex_2_a_c_type(value)
        add_attribute(Eccairs::Attributes::Annex2ACType, false, value)
      end

      # Add ats route name
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::AtsRouteName] The created attribute instance
      # @note Attribute ID: 46, XML Tag: ATS_Route_Name
      def add_ats_route_name(value)
        add_attribute(Eccairs::Attributes::AtsRouteName, false, value)
      end

      # Add bird size
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::BirdSize] The created attribute instance
      # @note Attribute ID: 648, XML Tag: Bird_Size
      def add_bird_size(value)
        add_attribute(Eccairs::Attributes::BirdSize, false, value)
      end

      # Add birds wildlife seen
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::BirdsWildlifeSeen] The created attribute instance
      # @note Attribute ID: 646, XML Tag: Birds_Wildlife_Seen
      def add_birds_wildlife_seen(value)
        add_attribute(Eccairs::Attributes::BirdsWildlifeSeen, false, value)
      end

      # Add birds wildlife struck
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::BirdsWildlifeStruck] The created attribute instance
      # @note Attribute ID: 647, XML Tag: Birds_Wildlife_Struck
      def add_birds_wildlife_struck(value)
        add_attribute(Eccairs::Attributes::BirdsWildlifeStruck, false, value)
      end

      # Add call sign
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::CallSign] The created attribute instance
      # @note Attribute ID: 54, XML Tag: Call_Sign
      def add_call_sign(value)
        add_attribute(Eccairs::Attributes::CallSign, false, value)
      end

      # Add clearance validity
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::ClearanceValidity] The created attribute instance
      # @note Attribute ID: 57, XML Tag: Clearance_Validity
      def add_clearance_validity(value)
        add_attribute(Eccairs::Attributes::ClearanceValidity, false, value)
      end

      # Add cleared altitude
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::ClearedAltitude] The created attribute instance
      # @note Attribute ID: 58, XML Tag: Cleared_Altitude
      def add_cleared_altitude(value)
        add_attribute(Eccairs::Attributes::ClearedAltitude, false, value)
      end

      # Add cleared fl after
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::ClearedFlAfter] The created attribute instance
      # @note Attribute ID: 817, XML Tag: Cleared_FL_After
      def add_cleared_fl_after(value)
        add_attribute(Eccairs::Attributes::ClearedFlAfter, false, value)
      end

      # Add cleared flight level
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::ClearedFlightLevel] The created attribute instance
      # @note Attribute ID: 60, XML Tag: Cleared_Flight_Level
      def add_cleared_flight_level(value)
        add_attribute(Eccairs::Attributes::ClearedFlightLevel, false, value)
      end

      # Add controlling agency
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::ControllingAgency] The created attribute instance
      # @note Attribute ID: 64, XML Tag: Controlling_Agency
      def add_controlling_agency(value)
        add_attribute(Eccairs::Attributes::ControllingAgency, false, value)
      end

      # Add current flight rules
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::CurrentFlightRules] The created attribute instance
      # @note Attribute ID: 79, XML Tag: Current_Flight_Rules
      def add_current_flight_rules(value)
        add_attribute(Eccairs::Attributes::CurrentFlightRules, false, value)
      end

      # Add current traffic type
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::CurrentTrafficType] The created attribute instance
      # @note Attribute ID: 29, XML Tag: Current_Traffic_Type
      def add_current_traffic_type(value)
        add_attribute(Eccairs::Attributes::CurrentTrafficType, false, value)
      end

      # Add filed flight rules
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::FiledFlightRules] The created attribute instance
      # @note Attribute ID: 117, XML Tag: Filed_Flight_Rules
      def add_filed_flight_rules(value)
        add_attribute(Eccairs::Attributes::FiledFlightRules, false, value)
      end

      # Add filed traffic type
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::FiledTrafficType] The created attribute instance
      # @note Attribute ID: 118, XML Tag: Filed_Traffic_Type
      def add_filed_traffic_type(value)
        add_attribute(Eccairs::Attributes::FiledTrafficType, false, value)
      end

      # Add flight number
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::FlightNumber] The created attribute instance
      # @note Attribute ID: 120, XML Tag: Flight_Number
      def add_flight_number(value)
        add_attribute(Eccairs::Attributes::FlightNumber, false, value)
      end

      # Add flight phase
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::FlightPhase] The created attribute instance
      # @note Attribute ID: 121, XML Tag: Flight_Phase
      def add_flight_phase(value)
        add_attribute(Eccairs::Attributes::FlightPhase, false, value)
      end

      # Add flight plan type
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::FlightPlanType] The created attribute instance
      # @note Attribute ID: 297, XML Tag: Flight_Plan_Type
      def add_flight_plan_type(value)
        add_attribute(Eccairs::Attributes::FlightPlanType, false, value)
      end

      # Add instrument appr type
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::InstrumentApprType] The created attribute instance
      # @note Attribute ID: 165, XML Tag: Instrument_Appr_Type
      def add_instrument_appr_type(value)
        add_attribute(Eccairs::Attributes::InstrumentApprType, false, value)
      end

      # Add landing gear type
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::LandingGearType] The created attribute instance
      # @note Attribute ID: 166, XML Tag: Landing_Gear_Type
      def add_landing_gear_type(value)
        add_attribute(Eccairs::Attributes::LandingGearType, false, value)
      end

      # Add last departure point
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::LastDeparturePoint] The created attribute instance
      # @note Attribute ID: 167, XML Tag: Last_Departure_Point
      def add_last_departure_point(value)
        add_attribute(Eccairs::Attributes::LastDeparturePoint, false, value)
      end

      # Add manufacturer model
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::ManufacturerModel] The created attribute instance
      # @note Attribute ID: 387, XML Tag: Manufacturer_Model
      def add_manufacturer_model(value)
        add_attribute(Eccairs::Attributes::ManufacturerModel, false, value)
      end

      # Add mass group
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::MassGroup] The created attribute instance
      # @note Attribute ID: 319, XML Tag: Mass_Group
      def add_mass_group(value)
        add_attribute(Eccairs::Attributes::MassGroup, false, value)
      end

      # Add maximum t o mass
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::MaximumTOMass] The created attribute instance
      # @note Attribute ID: 175, XML Tag: Maximum_T_O_Mass
      def add_maximum_t_o_mass(value)
        add_attribute(Eccairs::Attributes::MaximumTOMass, false, value)
      end

      # Add number of engines
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::NumberOfEngines] The created attribute instance
      # @note Attribute ID: 209, XML Tag: Number_Of_Engines
      def add_number_of_engines(value)
        add_attribute(Eccairs::Attributes::NumberOfEngines, false, value)
      end

      # Add occ on ground
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::OccOnGround] The created attribute instance
      # @note Attribute ID: 213, XML Tag: Occ_On_Ground
      def add_occ_on_ground(value)
        add_attribute(Eccairs::Attributes::OccOnGround, false, value)
      end

      # Add operation type
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::OperationType] The created attribute instance
      # @note Attribute ID: 214, XML Tag: Operation_Type
      def add_operation_type(value)
        add_attribute(Eccairs::Attributes::OperationType, false, value)
      end

      # Add operator
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::Operator] The created attribute instance
      # @note Attribute ID: 215, XML Tag: Operator
      def add_operator(value)
        add_attribute(Eccairs::Attributes::Operator, false, value)
      end

      # Add parts damaged
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::PartsDamaged] The created attribute instance
      # @note Attribute ID: 643, XML Tag: Parts_Damaged
      def add_parts_damaged(value)
        add_attribute(Eccairs::Attributes::PartsDamaged, false, value)
      end

      # Add parts struck
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::PartsStruck] The created attribute instance
      # @note Attribute ID: 644, XML Tag: Parts_Struck
      def add_parts_struck(value)
        add_attribute(Eccairs::Attributes::PartsStruck, false, value)
      end

      # Add pilot advised of birds
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::PilotAdvisedOfBirds] The created attribute instance
      # @note Attribute ID: 649, XML Tag: Pilot_Advised_Of_Birds
      def add_pilot_advised_of_birds(value)
        add_attribute(Eccairs::Attributes::PilotAdvisedOfBirds, false, value)
      end

      # Add planned destination
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::PlannedDestination] The created attribute instance
      # @note Attribute ID: 228, XML Tag: Planned_Destination
      def add_planned_destination(value)
        add_attribute(Eccairs::Attributes::PlannedDestination, false, value)
      end

      # Add propulsion type
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::PropulsionType] The created attribute instance
      # @note Attribute ID: 232, XML Tag: Propulsion_Type
      def add_propulsion_type(value)
        add_attribute(Eccairs::Attributes::PropulsionType, false, value)
      end

      # Add rel wind direction
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::RelWindDirection] The created attribute instance
      # @note Attribute ID: 245, XML Tag: Rel_Wind_Direction
      def add_rel_wind_direction(value)
        add_attribute(Eccairs::Attributes::RelWindDirection, false, value)
      end

      # Add serial number
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::SerialNumber] The created attribute instance
      # @note Attribute ID: 254, XML Tag: Serial_Number
      def add_serial_number(value)
        add_attribute(Eccairs::Attributes::SerialNumber, false, value)
      end

      # Add sid route
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::SidRoute] The created attribute instance
      # @note Attribute ID: 264, XML Tag: SID_Route
      def add_sid_route(value)
        add_attribute(Eccairs::Attributes::SidRoute, false, value)
      end

      # Add species description
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::SpeciesDescription] The created attribute instance
      # @note Attribute ID: 645, XML Tag: Species_Description
      def add_species_description(value)
        add_attribute(Eccairs::Attributes::SpeciesDescription, false, value)
      end

      # Add speed first event
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::SpeedFirstEvent] The created attribute instance
      # @note Attribute ID: 273, XML Tag: Speed_First_Event
      def add_speed_first_event(value)
        add_attribute(Eccairs::Attributes::SpeedFirstEvent, false, value)
      end

      # Add ssr mode
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::SsrMode] The created attribute instance
      # @note Attribute ID: 278, XML Tag: SSR_Mode
      def add_ssr_mode(value)
        add_attribute(Eccairs::Attributes::SsrMode, false, value)
      end

      # Add state of registry
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::StateOfRegistry] The created attribute instance
      # @note Attribute ID: 281, XML Tag: State_Of_Registry
      def add_state_of_registry(value)
        add_attribute(Eccairs::Attributes::StateOfRegistry, false, value)
      end

      # Add time deviating fl
      # @param value [String] The attribute value
      # @return [Eccairs::Attributes::TimeDeviatingFl] The created attribute instance
      # @note Attribute ID: 816, XML Tag: Time_Deviating_FL
      def add_time_deviating_fl(value)
        add_attribute(Eccairs::Attributes::TimeDeviatingFl, false, value)
      end

      # Add total cycles a c
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::TotalCyclesAC] The created attribute instance
      # @note Attribute ID: 33, XML Tag: Total_Cycles_A_C
      def add_total_cycles_a_c(value)
        add_attribute(Eccairs::Attributes::TotalCyclesAC, false, value)
      end

      # Add total number fatalities
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::TotalNumberFatalities] The created attribute instance
      # @note Attribute ID: 114, XML Tag: Total_Number_Fatalities
      def add_total_number_fatalities(value)
        add_attribute(Eccairs::Attributes::TotalNumberFatalities, false, value)
      end

      # Add total number minor injuries
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::TotalNumberMinorInjuries] The created attribute instance
      # @note Attribute ID: 187, XML Tag: Total_Number_Minor_Injuries
      def add_total_number_minor_injuries(value)
        add_attribute(Eccairs::Attributes::TotalNumberMinorInjuries, false, value)
      end

      # Add total number of persons
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::TotalNumberOfPersons] The created attribute instance
      # @note Attribute ID: 152, XML Tag: Total_Number_Of_Persons
      def add_total_number_of_persons(value)
        add_attribute(Eccairs::Attributes::TotalNumberOfPersons, false, value)
      end

      # Add total number serious injuries
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::TotalNumberSeriousInjuries] The created attribute instance
      # @note Attribute ID: 262, XML Tag: Total_Number_Serious_Injuries
      def add_total_number_serious_injuries(value)
        add_attribute(Eccairs::Attributes::TotalNumberSeriousInjuries, false, value)
      end

      # Add turbulence intensity
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::TurbulenceIntensity] The created attribute instance
      # @note Attribute ID: 293, XML Tag: Turbulence_Intensity
      def add_turbulence_intensity(value)
        add_attribute(Eccairs::Attributes::TurbulenceIntensity, false, value)
      end

      # Add type of airspeed
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::TypeOfAirspeed] The created attribute instance
      # @note Attribute ID: 276, XML Tag: Type_Of_Airspeed
      def add_type_of_airspeed(value)
        add_attribute(Eccairs::Attributes::TypeOfAirspeed, false, value)
      end

      # Add visib restrictions
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::VisibRestrictions] The created attribute instance
      # @note Attribute ID: 311, XML Tag: Visib_Restrictions
      def add_visib_restrictions(value)
        add_attribute(Eccairs::Attributes::VisibRestrictions, false, value)
      end

      # Add wake turb category
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::WakeTurbCategory] The created attribute instance
      # @note Attribute ID: 313, XML Tag: Wake_Turb_Category
      def add_wake_turb_category(value)
        add_attribute(Eccairs::Attributes::WakeTurbCategory, false, value)
      end

      # Add year built
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::YearBuilt] The created attribute instance
      # @note Attribute ID: 327, XML Tag: Year_Built
      def add_year_built(value)
        add_attribute(Eccairs::Attributes::YearBuilt, false, value)
      end

      # Add engine entity
      # @yield [engine] Block for configuring the engine
      # @yieldparam engine [Eccairs::Entities::Engine] The entity instance
      # @return [Eccairs::Entities::Engine] The created entity instance
      # @note Entity ID: 13, XML Tag: Engine
      def add_engine(&block)
        add_entity(Eccairs::Entities::Engine, false, &block)
      end

      # Add flight crew member entity
      # @yield [flight_crew_member] Block for configuring the flight crew member
      # @yieldparam flight_crew_member [Eccairs::Entities::FlightCrewMember] The entity instance
      # @return [Eccairs::Entities::FlightCrewMember] The created entity instance
      # @note Entity ID: 17, XML Tag: Flight_Crew_Member
      def add_flight_crew_member(&block)
        add_entity(Eccairs::Entities::FlightCrewMember, false, &block)
      end

      # Add incapacitation entity
      # @yield [incapacitation] Block for configuring the incapacitation
      # @yieldparam incapacitation [Eccairs::Entities::Incapacitation] The entity instance
      # @return [Eccairs::Entities::Incapacitation] The created entity instance
      # @note Entity ID: 20, XML Tag: Incapacitation
      def add_incapacitation(&block)
        add_entity(Eccairs::Entities::Incapacitation, false, &block)
      end

      # Add narrative entity
      # @yield [narrative] Block for configuring the narrative
      # @yieldparam narrative [Eccairs::Entities::AircraftNarrative] The entity instance
      # @return [Eccairs::Entities::AircraftNarrative] The created entity instance
      # @note Entity ID: 22, XML Tag: Narrative
      def add_narrative(&block)
        add_entity(Eccairs::Entities::AircraftNarrative, false, &block)
      end

      # Add part information entity
      # @yield [part_information] Block for configuring the part information
      # @yieldparam part_information [Eccairs::Entities::PartInformation] The entity instance
      # @return [Eccairs::Entities::PartInformation] The created entity instance
      # @note Entity ID: 26, XML Tag: Part_Information
      def add_part_information(&block)
        add_entity(Eccairs::Entities::PartInformation, false, &block)
      end

      # Add propeller entity
      # @yield [propeller] Block for configuring the propeller
      # @yieldparam propeller [Eccairs::Entities::Propeller] The entity instance
      # @return [Eccairs::Entities::Propeller] The created entity instance
      # @note Entity ID: 29, XML Tag: Propeller
      def add_propeller(&block)
        add_entity(Eccairs::Entities::Propeller, false, &block)
      end
    end
  end
end
