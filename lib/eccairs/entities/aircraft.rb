# frozen_string_literal: true

module Eccairs
  module Entities
    class Aircraft < Eccairs::Base::Entity
      entity_id "4"
      xml_tag "Aircraft"
      requires_id

      belongs_to :occurrence

      # Aircraft attributes
      has_many :aircraft_altitude, class_name: "Eccairs::Attributes::AircraftAltitude"
      has_many :aircraft_category, class_name: "Eccairs::Attributes::AircraftCategory"
      has_many :a_c_flight_level, class_name: "Eccairs::Attributes::ACFlightLevel"
      has_many :aircraft_registration, class_name: "Eccairs::Attributes::AircraftRegistration"
      has_many :aircraft_total_time, class_name: "Eccairs::Attributes::AircraftTotalTime"
      has_many :annex_2_a_c_type, class_name: "Eccairs::Attributes::Annex2ACType"
      has_many :ats_route_name, class_name: "Eccairs::Attributes::AtsRouteName"
      has_many :bird_size, class_name: "Eccairs::Attributes::BirdSize"
      has_many :birds_wildlife_seen, class_name: "Eccairs::Attributes::BirdsWildlifeSeen"
      has_many :birds_wildlife_struck, class_name: "Eccairs::Attributes::BirdsWildlifeStruck"
      has_many :call_sign, class_name: "Eccairs::Attributes::CallSign"
      has_many :clearance_validity, class_name: "Eccairs::Attributes::ClearanceValidity"
      has_many :cleared_altitude, class_name: "Eccairs::Attributes::ClearedAltitude"
      has_many :cleared_fl_after, class_name: "Eccairs::Attributes::ClearedFlAfter"
      has_many :cleared_flight_level, class_name: "Eccairs::Attributes::ClearedFlightLevel"
      has_many :controlling_agency, class_name: "Eccairs::Attributes::ControllingAgency"
      has_many :current_flight_rules, class_name: "Eccairs::Attributes::CurrentFlightRules"
      has_many :current_traffic_type, class_name: "Eccairs::Attributes::CurrentTrafficType"
      has_many :filed_flight_rules, class_name: "Eccairs::Attributes::FiledFlightRules"
      has_many :filed_traffic_type, class_name: "Eccairs::Attributes::FiledTrafficType"
      has_many :flight_number, class_name: "Eccairs::Attributes::FlightNumber"
      has_many :flight_phase, class_name: "Eccairs::Attributes::FlightPhase"
      has_many :flight_plan_type, class_name: "Eccairs::Attributes::FlightPlanType"
      has_many :instrument_appr_type, class_name: "Eccairs::Attributes::InstrumentApprType"
      has_many :landing_gear_type, class_name: "Eccairs::Attributes::LandingGearType"
      has_many :last_departure_point, class_name: "Eccairs::Attributes::LastDeparturePoint"
      has_many :manufacturer_model, class_name: "Eccairs::Attributes::ManufacturerModel"
      has_many :mass_group, class_name: "Eccairs::Attributes::MassGroup"
      has_many :maximum_t_o_mass, class_name: "Eccairs::Attributes::MaximumTOMass"
      has_many :number_of_engines, class_name: "Eccairs::Attributes::NumberOfEngines"
      has_many :occ_on_ground, class_name: "Eccairs::Attributes::OccOnGround"
      has_many :operation_type, class_name: "Eccairs::Attributes::OperationType"
      has_many :operator, class_name: "Eccairs::Attributes::Operator"
      has_many :parts_damaged, class_name: "Eccairs::Attributes::PartsDamaged"
      has_many :parts_struck, class_name: "Eccairs::Attributes::PartsStruck"
      has_many :pilot_advised_of_birds, class_name: "Eccairs::Attributes::PilotAdvisedOfBirds"
      has_many :planned_destination, class_name: "Eccairs::Attributes::PlannedDestination"
      has_many :propulsion_type, class_name: "Eccairs::Attributes::PropulsionType"
      has_many :rel_wind_direction, class_name: "Eccairs::Attributes::RelWindDirection"
      has_many :serial_number, class_name: "Eccairs::Attributes::SerialNumber"
      has_many :sid_route, class_name: "Eccairs::Attributes::SidRoute"
      has_many :species_description, class_name: "Eccairs::Attributes::SpeciesDescription"
      has_many :speed_first_event, class_name: "Eccairs::Attributes::SpeedFirstEvent"
      has_many :ssr_mode, class_name: "Eccairs::Attributes::SsrMode"
      has_many :state_of_registry, class_name: "Eccairs::Attributes::StateOfRegistry"
      has_many :time_deviating_fl, class_name: "Eccairs::Attributes::TimeDeviatingFl"
      has_many :total_cycles_a_c, class_name: "Eccairs::Attributes::TotalCyclesAC"
      has_many :total_number_fatalities, class_name: "Eccairs::Attributes::TotalNumberFatalities"
      has_many :total_number_minor_injuries, class_name: "Eccairs::Attributes::TotalNumberMinorInjuries"
      has_many :total_number_of_persons, class_name: "Eccairs::Attributes::TotalNumberOfPersons"
      has_many :total_number_serious_injuries, class_name: "Eccairs::Attributes::TotalNumberSeriousInjuries"
      has_many :turbulence_intensity, class_name: "Eccairs::Attributes::TurbulenceIntensity"
      has_many :type_of_airspeed, class_name: "Eccairs::Attributes::TypeOfAirspeed"
      has_many :visib_restrictions, class_name: "Eccairs::Attributes::VisibRestrictions"
      has_many :wake_turb_category, class_name: "Eccairs::Attributes::WakeTurbCategory"
      has_many :year_built, class_name: "Eccairs::Attributes::YearBuilt"

      # Nested entities
      has_many :engine, class_name: "Eccairs::Entities::Engine"
      has_many :flight_crew_member, class_name: "Eccairs::Entities::FlightCrewMember"
      has_many :incapacitation, class_name: "Eccairs::Entities::Incapacitation"
      has_one :narrative, class_name: "Eccairs::Entities::AircraftNarrative"
      has_many :part_information, class_name: "Eccairs::Entities::PartInformation"
      has_many :propeller, class_name: "Eccairs::Entities::Propeller"
    end
  end
end
