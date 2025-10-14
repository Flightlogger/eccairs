# frozen_string_literal: true

module Eccairs
  module Entities
    class Occurrence < Eccairs::Base::Entity
      entity_id "24"
      xml_tag "Occurrence"
      sequence 1

      # Direct occurrence attributes

      # Add air temperature
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::AirTemperature] The created attribute instance
      # @note Attribute ID: 287, XML Tag: Air_Temperature
      def add_air_temperature(value)
        add_attribute(Eccairs::Attributes::AirTemperature, false, value)
      end

      # Add atm contribution
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::AtmContribution] The created attribute instance
      # @note Attribute ID: 428, XML Tag: ATM_Contribution
      def add_atm_contribution(value)
        add_attribute(Eccairs::Attributes::AtmContribution, false, value)
      end

      # Add authority occ closure
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::AuthorityOccClosure] The created attribute instance
      # @note Attribute ID: 1087, XML Tag: Authority_Occ_Closure
      def add_authority_occ_closure(value)
        add_attribute(Eccairs::Attributes::AuthorityOccClosure, false, value)
      end

      # Add aviation sector
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::AviationSector] The created attribute instance
      # @note Attribute ID: 1088, XML Tag: Aviation_Sector
      def add_aviation_sector(value)
        add_attribute(Eccairs::Attributes::AviationSector, false, value)
      end

      # Add cloud amount
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::CloudAmount] The created attribute instance
      # @note Attribute ID: 266, XML Tag: Cloud_Amount
      def add_cloud_amount(value)
        add_attribute(Eccairs::Attributes::CloudAmount, false, value)
      end

      # Add damage not to a c
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::DamageNotToAC] The created attribute instance
      # @note Attribute ID: 448, XML Tag: Damage_Not_To_A_C
      def add_damage_not_to_a_c(value)
        add_attribute(Eccairs::Attributes::DamageNotToAC, false, value)
      end

      # Add dang goods involved
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::DangGoodsInvolved] The created attribute instance
      # @note Attribute ID: 129, XML Tag: Dang_Goods_Involved
      def add_dang_goods_involved(value)
        add_attribute(Eccairs::Attributes::DangGoodsInvolved, false, value)
      end

      # Add detection phase
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::DetectionPhase] The created attribute instance
      # @note Attribute ID: 1072, XML Tag: Detection_Phase
      def add_detection_phase(value)
        add_attribute(Eccairs::Attributes::DetectionPhase, false, value)
      end

      # Add dew point
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::DewPoint] The created attribute instance
      # @note Attribute ID: 85, XML Tag: Dew_Point
      def add_dew_point(value)
        add_attribute(Eccairs::Attributes::DewPoint, false, value)
      end

      # Add effect on atm service
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::EffectOnAtmService] The created attribute instance
      # @note Attribute ID: 436, XML Tag: Effect_On_ATM_Service
      def add_effect_on_atm_service(value)
        add_attribute(Eccairs::Attributes::EffectOnAtmService, false, value)
      end

      # Add file number
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::FileNumber] The created attribute instance
      # @note Attribute ID: 452, XML Tag: File_Number
      def add_file_number(value)
        add_attribute(Eccairs::Attributes::FileNumber, false, value)
      end

      # Add ground repeatability
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::GroundRepeatability] The created attribute instance
      # @note Attribute ID: 1075, XML Tag: Ground_Repeatability
      def add_ground_repeatability(value)
        add_attribute(Eccairs::Attributes::GroundRepeatability, false, value)
      end

      # Add ground severity
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::GroundSeverity] The created attribute instance
      # @note Attribute ID: 1074, XML Tag: Ground_Severity
      def add_ground_severity(value)
        add_attribute(Eccairs::Attributes::GroundSeverity, false, value)
      end

      # Add ground severity applied
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::GroundSeverityApplied] The created attribute instance
      # @note Attribute ID: 1073, XML Tag: Ground_Severity_Applied
      def add_ground_severity_applied(value)
        add_attribute(Eccairs::Attributes::GroundSeverityApplied, false, value)
      end

      # Add headline
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::Headline] The created attribute instance
      # @note Attribute ID: 601, XML Tag: Headline
      def add_headline(value)
        add_attribute(Eccairs::Attributes::Headline, false, value)
      end

      # Add height of cloud base
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::HeightOfCloudBase] The created attribute instance
      # @note Attribute ID: 140, XML Tag: Height_Of_Cloud_Base
      def add_height_of_cloud_base(value)
        add_attribute(Eccairs::Attributes::HeightOfCloudBase, false, value)
      end

      # Add highest damage
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::HighestDamage] The created attribute instance
      # @note Attribute ID: 432, XML Tag: Highest_Damage
      def add_highest_damage(value)
        add_attribute(Eccairs::Attributes::HighestDamage, false, value)
      end

      # Add injury level
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::InjuryLevel] The created attribute instance
      # @note Attribute ID: 451, XML Tag: Injury_Level
      def add_injury_level(value)
        add_attribute(Eccairs::Attributes::InjuryLevel, false, value)
      end

      # Add latitude of occ
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::LatitudeOfOcc] The created attribute instance
      # @note Attribute ID: 439, XML Tag: Latitude_Of_Occ
      def add_latitude_of_occ(value)
        add_attribute(Eccairs::Attributes::LatitudeOfOcc, false, value)
      end

      # Add light conditions
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::LightConditions] The created attribute instance
      # @note Attribute ID: 168, XML Tag: Light_Conditions
      def add_light_conditions(value)
        add_attribute(Eccairs::Attributes::LightConditions, false, value)
      end

      # Add local date
      # @param value [String] The attribute value
      # @return [Eccairs::Attributes::LocalDate] The created attribute instance
      # @note Attribute ID: 433, XML Tag: Local_Date
      def add_local_date(value)
        add_attribute(Eccairs::Attributes::LocalDate, false, value)
      end

      # Add local time
      # @param value [String] The attribute value
      # @return [Eccairs::Attributes::LocalTime] The created attribute instance
      # @note Attribute ID: 457, XML Tag: Local_Time
      def add_local_time(value)
        add_attribute(Eccairs::Attributes::LocalTime, false, value)
      end

      # Add location name
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::LocationName] The created attribute instance
      # @note Attribute ID: 440, XML Tag: Location_Name
      def add_location_name(value)
        add_attribute(Eccairs::Attributes::LocationName, false, value)
      end

      # Add longitude of occ
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::LongitudeOfOcc] The created attribute instance
      # @note Attribute ID: 444, XML Tag: Longitude_Of_Occ
      def add_longitude_of_occ(value)
        add_attribute(Eccairs::Attributes::LongitudeOfOcc, false, value)
      end

      # Add maximum gust
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::MaximumGust] The created attribute instance
      # @note Attribute ID: 176, XML Tag: Maximum_Gust
      def add_maximum_gust(value)
        add_attribute(Eccairs::Attributes::MaximumGust, false, value)
      end

      # Add object damaged
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::ObjectDamaged] The created attribute instance
      # @note Attribute ID: 640, XML Tag: Object_Damaged
      def add_object_damaged(value)
        add_attribute(Eccairs::Attributes::ObjectDamaged, false, value)
      end

      # Add occurrence category
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::OccurrenceCategory] The created attribute instance
      # @note Attribute ID: 430, XML Tag: Occurrence_Category
      def add_occurrence_category(value)
        add_attribute(Eccairs::Attributes::OccurrenceCategory, false, value)
      end

      # Add occurrence class
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::OccurrenceClass] The created attribute instance
      # @note Attribute ID: 431, XML Tag: Occurrence_Class
      def add_occurrence_class(value)
        add_attribute(Eccairs::Attributes::OccurrenceClass, false, value)
      end

      # Add occurrence status
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::OccurrenceStatus] The created attribute instance
      # @note Attribute ID: 455, XML Tag: Occurrence_Status
      def add_occurrence_status(value)
        add_attribute(Eccairs::Attributes::OccurrenceStatus, false, value)
      end

      # Add overall repeatability
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::OverallRepeatability] The created attribute instance
      # @note Attribute ID: 1078, XML Tag: Overall_Repeatability
      def add_overall_repeatability(value)
        add_attribute(Eccairs::Attributes::OverallRepeatability, false, value)
      end

      # Add overall severity
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::OverallSeverity] The created attribute instance
      # @note Attribute ID: 1077, XML Tag: Overall_Severity
      def add_overall_severity(value)
        add_attribute(Eccairs::Attributes::OverallSeverity, false, value)
      end

      # Add overall severity applied
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::OverallSeverityApplied] The created attribute instance
      # @note Attribute ID: 1076, XML Tag: Overall_Severity_Applied
      def add_overall_severity_applied(value)
        add_attribute(Eccairs::Attributes::OverallSeverityApplied, false, value)
      end

      # Add responsible entity
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::ResponsibleEntity] The created attribute instance
      # @note Attribute ID: 453, XML Tag: Responsible_Entity
      def add_responsible_entity(value)
        add_attribute(Eccairs::Attributes::ResponsibleEntity, false, value)
      end

      # Add spec tech repeatability
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::SpecTechRepeatability] The created attribute instance
      # @note Attribute ID: 1081, XML Tag: Spec_Tech_Repeatability
      def add_spec_tech_repeatability(value)
        add_attribute(Eccairs::Attributes::SpecTechRepeatability, false, value)
      end

      # Add spec tech severity
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::SpecTechSeverity] The created attribute instance
      # @note Attribute ID: 1080, XML Tag: Spec_Tech_Severity
      def add_spec_tech_severity(value)
        add_attribute(Eccairs::Attributes::SpecTechSeverity, false, value)
      end

      # Add spec tech severity applied
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::SpecTechSeverityApplied] The created attribute instance
      # @note Attribute ID: 1079, XML Tag: Spec_Tech_Severity_Applied
      def add_spec_tech_severity_applied(value)
        add_attribute(Eccairs::Attributes::SpecTechSeverityApplied, false, value)
      end

      # Add speed measured at
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::SpeedMeasuredAt] The created attribute instance
      # @note Attribute ID: 275, XML Tag: Speed_Measured_At
      def add_speed_measured_at(value)
        add_attribute(Eccairs::Attributes::SpeedMeasuredAt, false, value)
      end

      # Add state area of occ
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::StateAreaOfOcc] The created attribute instance
      # @note Attribute ID: 454, XML Tag: State_Area_Of_Occ
      def add_state_area_of_occ(value)
        add_attribute(Eccairs::Attributes::StateAreaOfOcc, false, value)
      end

      # Add third party damage
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::ThirdPartyDamage] The created attribute instance
      # @note Attribute ID: 456, XML Tag: Third_Party_Damage
      def add_third_party_damage(value)
        add_attribute(Eccairs::Attributes::ThirdPartyDamage, false, value)
      end

      # Add total fatalities ground
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::TotalFatalitiesGround] The created attribute instance
      # @note Attribute ID: 460, XML Tag: Total_Fatalities_Ground
      def add_total_fatalities_ground(value)
        add_attribute(Eccairs::Attributes::TotalFatalitiesGround, false, value)
      end

      # Add total injuries ground
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::TotalInjuriesGround] The created attribute instance
      # @note Attribute ID: 463, XML Tag: Total_Injuries-Ground
      def add_total_injuries_ground(value)
        add_attribute(Eccairs::Attributes::TotalInjuriesGround, false, value)
      end

      # Add total minor injuries ground
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::TotalMinorInjuriesGround] The created attribute instance
      # @note Attribute ID: 469, XML Tag: Total_Minor_Injuries-Ground
      def add_total_minor_injuries_ground(value)
        add_attribute(Eccairs::Attributes::TotalMinorInjuriesGround, false, value)
      end

      # Add total on board a c
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::TotalOnBoardAC] The created attribute instance
      # @note Attribute ID: 462, XML Tag: Total_On_Board_A_C
      def add_total_on_board_a_c(value)
        add_attribute(Eccairs::Attributes::TotalOnBoardAC, false, value)
      end

      # Add total serious injuries ground
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::TotalSeriousInjuriesGround] The created attribute instance
      # @note Attribute ID: 472, XML Tag: Total_Serious_Injuries-Ground
      def add_total_serious_injuries_ground(value)
        add_attribute(Eccairs::Attributes::TotalSeriousInjuriesGround, false, value)
      end

      # Add utc date
      # @param value [String] The attribute value
      # @return [Eccairs::Attributes::UtcDate] The created attribute instance
      # @note Attribute ID: 477, XML Tag: UTC_Date
      def add_utc_date(value)
        add_attribute(Eccairs::Attributes::UtcDate, false, value)
      end

      # Add utc time
      # @param value [String] The attribute value
      # @return [Eccairs::Attributes::UtcTime] The created attribute instance
      # @note Attribute ID: 478, XML Tag: UTC_Time
      def add_utc_time(value)
        add_attribute(Eccairs::Attributes::UtcTime, false, value)
      end

      # Add visibility
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::Visibility] The created attribute instance
      # @note Attribute ID: 310, XML Tag: Visibility
      def add_visibility(value)
        add_attribute(Eccairs::Attributes::Visibility, false, value)
      end

      # Add weather relevant
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::WeatherRelevant] The created attribute instance
      # @note Attribute ID: 606, XML Tag: Weather_Relevant
      def add_weather_relevant(value)
        add_attribute(Eccairs::Attributes::WeatherRelevant, false, value)
      end

      # Add wind direction
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::WindDirection] The created attribute instance
      # @note Attribute ID: 320, XML Tag: Wind_Direction
      def add_wind_direction(value)
        add_attribute(Eccairs::Attributes::WindDirection, false, value)
      end

      # Add wind gusts
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::WindGusts] The created attribute instance
      # @note Attribute ID: 321, XML Tag: Wind_Gusts
      def add_wind_gusts(value)
        add_attribute(Eccairs::Attributes::WindGusts, false, value)
      end

      # Add wind speed
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::WindSpeed] The created attribute instance
      # @note Attribute ID: 322, XML Tag: Wind_Speed
      def add_wind_speed(value)
        add_attribute(Eccairs::Attributes::WindSpeed, false, value)
      end

      # Add wx conditions
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::WxConditions] The created attribute instance
      # @note Attribute ID: 127, XML Tag: Wx_Conditions
      def add_wx_conditions(value)
        add_attribute(Eccairs::Attributes::WxConditions, false, value)
      end

      # Add aircraft entity
      # @param id [String, nil] The entity ID (optional)
      # @yield [aircraft] Block for configuring the aircraft
      # @yieldparam aircraft [Eccairs::Entities::Aircraft] The entity instance
      # @return [Eccairs::Entities::Aircraft] The created entity instance
      # @note Entity ID: 4, XML Tag: Aircraft
      def add_aircraft(id: nil, &block)
        add_entity(Eccairs::Entities::Aircraft, false, id: id, &block)
      end

      # Add aerodrome general entity
      # @yield [aerodrome_general] Block for configuring the aerodrome general
      # @yieldparam aerodrome_general [Eccairs::Entities::AerodromeGeneral] The entity instance
      # @return [Eccairs::Entities::AerodromeGeneral] The created entity instance
      # @note Entity ID: 1, XML Tag: Aerodrome_General
      def add_aerodrome_general(&block)
        add_entity(Eccairs::Entities::AerodromeGeneral, false, &block)
      end

      # Add aerodrome weather reports entity
      # @yield [aerodrome_weather_reports] Block for configuring the aerodrome weather reports
      # @yieldparam aerodrome_weather_reports [Eccairs::Entities::AerodromeWeatherReports] The entity instance
      # @return [Eccairs::Entities::AerodromeWeatherReports] The created entity instance
      # @note Entity ID: 2, XML Tag: Aerodrome_Weather_Reports
      def add_aerodrome_weather_reports(&block)
        add_entity(Eccairs::Entities::AerodromeWeatherReports, false, &block)
      end

      # Add air navigation service entity
      # @yield [air_navigation_service] Block for configuring the air navigation service
      # @yieldparam air_navigation_service [Eccairs::Entities::AirNavigationService] The entity instance
      # @return [Eccairs::Entities::AirNavigationService] The created entity instance
      # @note Entity ID: 10, XML Tag: Air_Navigation_Service
      def add_air_navigation_service(&block)
        add_entity(Eccairs::Entities::AirNavigationService, false, &block)
      end

      # Add air space entity
      # @param id [String, nil] The entity ID (optional)
      # @yield [air_space] Block for configuring the air space
      # @yieldparam air_space [Eccairs::Entities::AirSpace] The entity instance
      # @return [Eccairs::Entities::AirSpace] The created entity instance
      # @note Entity ID: 3, XML Tag: Air_Space
      def add_air_space(id: nil, &block)
        add_entity(Eccairs::Entities::AirSpace, false, id: id, &block)
      end

      # Add dangerous goods entity
      # @param id [String, nil] The entity ID (optional)
      # @yield [dangerous_goods] Block for configuring the dangerous goods
      # @yieldparam dangerous_goods [Eccairs::Entities::DangerousGoods] The entity instance
      # @return [Eccairs::Entities::DangerousGoods] The created entity instance
      # @note Entity ID: 43, XML Tag: Dangerous_Goods
      def add_dangerous_goods(id: nil, &block)
        add_entity(Eccairs::Entities::DangerousGoods, false, id: id, &block)
      end

      # Add events entity
      # @param id [String, nil] The entity ID (optional)
      # @yield [events] Block for configuring the events
      # @yieldparam events [Eccairs::Entities::Events] The entity instance
      # @return [Eccairs::Entities::Events] The created entity instance
      # @note Entity ID: 14, XML Tag: Events
      def add_events(id: nil, &block)
        add_entity(Eccairs::Entities::Events, false, id: id, &block)
      end

      # Add ground handling entity
      # @yield [ground_handling] Block for configuring the ground handling
      # @yieldparam ground_handling [Eccairs::Entities::GroundHandling] The entity instance
      # @return [Eccairs::Entities::GroundHandling] The created entity instance
      # @note Entity ID: 60, XML Tag: Ground_Handling
      def add_ground_handling(&block)
        add_entity(Eccairs::Entities::GroundHandling, false, &block)
      end

      # Add narrative entity
      # @yield [narrative] Block for configuring the narrative
      # @yieldparam narrative [Eccairs::Entities::Narrative] The entity instance
      # @return [Eccairs::Entities::Narrative] The created entity instance
      # @note Entity ID: 22, XML Tag: Narrative
      def add_narrative(&block)
        add_entity(Eccairs::Entities::Narrative, false, &block)
      end

      # Add precipitation and other weather phenomena entity
      # @yield [precipitation_and_other_weather_phenomena] Block for configuring the precipitation and other weather phenomena
      # @yieldparam precipitation_and_other_weather_phenomena [Eccairs::Entities::PrecipitationAndOtherWeatherPhenomena] The entity instance
      # @return [Eccairs::Entities::PrecipitationAndOtherWeatherPhenomena] The created entity instance
      # @note Entity ID: 28, XML Tag: Precipitation_And_Other_Weather_Phenomena
      def add_precipitation_and_other_weather_phenomena(&block)
        add_entity(Eccairs::Entities::PrecipitationAndOtherWeatherPhenomena, false, &block)
      end

      # Add reporting history entity
      # @yield [reporting_history] Block for configuring the reporting history
      # @yieldparam reporting_history [Eccairs::Entities::ReportingHistory] The entity instance
      # @return [Eccairs::Entities::ReportingHistory] The created entity instance
      # @note Entity ID: 53, XML Tag: Reporting_History
      def add_reporting_history(&block)
        add_entity(Eccairs::Entities::ReportingHistory, false, &block)
      end

      # Add risk assessment entity
      # @yield [risk_assessment] Block for configuring the risk assessment
      # @yieldparam risk_assessment [Eccairs::Entities::RiskAssessment] The entity instance
      # @return [Eccairs::Entities::RiskAssessment] The created entity instance
      # @note Entity ID: 59, XML Tag: Risk_Assessment
      def add_risk_assessment(&block)
        add_entity(Eccairs::Entities::RiskAssessment, false, &block)
      end

      # Add runway incursion entity
      # @yield [runway_incursion] Block for configuring the runway incursion
      # @yieldparam runway_incursion [Eccairs::Entities::RunwayIncursion] The entity instance
      # @return [Eccairs::Entities::RunwayIncursion] The created entity instance
      # @note Entity ID: 47, XML Tag: Runway_Incursion
      def add_runway_incursion(&block)
        add_entity(Eccairs::Entities::RunwayIncursion, false, &block)
      end

      # Add separation entity
      # @yield [separation] Block for configuring the separation
      # @yieldparam separation [Eccairs::Entities::Separation] The entity instance
      # @return [Eccairs::Entities::Separation] The created entity instance
      # @note Entity ID: 34, XML Tag: Separation
      def add_separation(&block)
        add_entity(Eccairs::Entities::Separation, false, &block)
      end
    end
  end
end
