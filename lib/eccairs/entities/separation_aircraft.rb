# frozen_string_literal: true

module Eccairs
  module Entities
    class SeparationAircraft < Eccairs::Base::Entity
      entity_id "35"
      xml_tag "Separation_Aircraft"
      sequence 1

      # Add separation traffic info type quality entity
      # @yield [separation_traffic_info_type_quality] Block for configuring the separation traffic info type quality
      # @yieldparam separation_traffic_info_type_quality [Eccairs::Entities::SeparationTrafficInfoTypeQuality] The entity instance
      # @return [Eccairs::Entities::SeparationTrafficInfoTypeQuality] The created entity instance
      # @note Entity ID: 36, XML Tag: Separation_Traffic_Info_Type_Quality
      def add_separation_traffic_info_type_quality(&block)
        add_entity(Eccairs::Entities::SeparationTrafficInfoTypeQuality, false, &block)
      end

      # Add atm action
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::AtmAction] The created attribute instance
      # @note Attribute ID: 565, XML Tag: ATM_Action
      def add_atm_action(value)
        add_attribute(Eccairs::Attributes::AtmAction, false, value)
      end

      # Add a c avoiding action
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::ACAvoidingAction] The created attribute instance
      # @note Attribute ID: 566, XML Tag: A_C_Avoiding_Action
      def add_a_c_avoiding_action(value)
        add_attribute(Eccairs::Attributes::ACAvoidingAction, false, value)
      end

      # Add other aircraft seen
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::OtherAircraftSeen] The created attribute instance
      # @note Attribute ID: 587, XML Tag: Other_Aircraft_Seen
      def add_other_aircraft_seen(value)
        add_attribute(Eccairs::Attributes::OtherAircraftSeen, false, value)
      end

      # Add risk reduction a c
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::RiskReductionAC] The created attribute instance
      # @note Attribute ID: 591, XML Tag: Risk_Reduction_A_C
      def add_risk_reduction_a_c(value)
        add_attribute(Eccairs::Attributes::RiskReductionAC, false, value)
      end

      # Add height altitude
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::HeightAltitude] The created attribute instance
      # @note Attribute ID: 597, XML Tag: Height_Altitude
      def add_height_altitude(value)
        add_attribute(Eccairs::Attributes::HeightAltitude, false, value)
      end

      # Add vertical profile of separation
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::VerticalProfileOfSeparation] The created attribute instance
      # @note Attribute ID: 598, XML Tag: Vertical_Profile_Of_Separation
      def add_vertical_profile_of_separation(value)
        add_attribute(Eccairs::Attributes::VerticalProfileOfSeparation, false, value)
      end

      # Add ra type
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::RaType] The created attribute instance
      # @note Attribute ID: 610, XML Tag: RA_Type
      def add_ra_type(value)
        add_attribute(Eccairs::Attributes::RaType, false, value)
      end

      # Add pilot response to ra
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::PilotResponseToRa] The created attribute instance
      # @note Attribute ID: 611, XML Tag: Pilot_Response_To_RA
      def add_pilot_response_to_ra(value)
        add_attribute(Eccairs::Attributes::PilotResponseToRa, false, value)
      end

      # Add ra classification
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::RaClassification] The created attribute instance
      # @note Attribute ID: 613, XML Tag: RA_Classification
      def add_ra_classification(value)
        add_attribute(Eccairs::Attributes::RaClassification, false, value)
      end
    end
  end
end
