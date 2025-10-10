# frozen_string_literal: true

module Eccairs
  module Entities
    class FlightCrewMember < Eccairs::Base::Entity
      entity_id "17"
      xml_tag "Flight_Crew_Member"

      # Add flight crew licenses entity
      # @yield [flight_crew_licenses] Block for configuring the flight crew licenses
      # @yieldparam flight_crew_licenses [Eccairs::Entities::FlightCrewLicenses] The entity instance
      # @return [Eccairs::Entities::FlightCrewLicenses] The created entity instance
      # @note Entity ID: 16, XML Tag: Flight_Crew_Licenses
      def add_flight_crew_licenses(&block)
        add_entity(Eccairs::Entities::FlightCrewLicenses, false, &block)
      end

      # Add category
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::Category] The created attribute instance
      # @note Attribute ID: 402, XML Tag: Category
      def add_category(value)
        add_attribute(Eccairs::Attributes::Category, false, value)
      end

      # Add duty last 24 hours
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::DutyLast24Hours] The created attribute instance
      # @note Attribute ID: 403, XML Tag: Duty_Last_24_Hours
      def add_duty_last_24_hours(value)
        add_attribute(Eccairs::Attributes::DutyLast24Hours, value)
      end

      # Add experience all a c
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::ExperienceAllAC] The created attribute instance
      # @note Attribute ID: 410, XML Tag: Experience_All_A_C
      def add_experience_all_a_c(value)
        add_attribute(Eccairs::Attributes::ExperienceAllAC, false, value)
      end

      # Add experience this a c
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::ExperienceThisAC] The created attribute instance
      # @note Attribute ID: 411, XML Tag: Experience_This_A_C
      def add_experience_this_a_c(value)
        add_attribute(Eccairs::Attributes::ExperienceThisAC, false, value)
      end

      # Add rest before duty
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::RestBeforeDuty] The created attribute instance
      # @note Attribute ID: 408, XML Tag: Rest_Before_Duty
      def add_rest_before_duty(value)
        add_attribute(Eccairs::Attributes::RestBeforeDuty, false, value)
      end
    end
  end
end
