# frozen_string_literal: true

module Eccairs
  module Entities
    class AirNavigationService < Eccairs::Base::Entity
      entity_id "10"
      xml_tag "Air_Navigation_Service"
      sequence 5

      # Add ansp name
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::AnspName] The created attribute instance
      # @note Attribute ID: 372, XML Tag: ANSP_Name
      def add_ansp_name(value)
        add_attribute(Eccairs::Attributes::AnspName, false, value)
      end

      # Add apw alerting
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::ApwAlerting] The created attribute instance
      # @note Attribute ID: 363, XML Tag: APW_Alerting
      def add_apw_alerting(value)
        add_attribute(Eccairs::Attributes::ApwAlerting, false, value)
      end

      # Add msaw current alerting
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::MsawCurrentAlerting] The created attribute instance
      # @note Attribute ID: 369, XML Tag: MSAW_Current_Alerting
      def add_msaw_current_alerting(value)
        add_attribute(Eccairs::Attributes::MsawCurrentAlerting, false, value)
      end

      # Add rimcas alerting
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::RimcasAlerting] The created attribute instance
      # @note Attribute ID: 366, XML Tag: RIMCAS_Alerting
      def add_rimcas_alerting(value)
        add_attribute(Eccairs::Attributes::RimcasAlerting, false, value)
      end

      # Add stca current alerting
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::StcaCurrentAlerting] The created attribute instance
      # @note Attribute ID: 379, XML Tag: STCA_Current_Alerting
      def add_stca_current_alerting(value)
        add_attribute(Eccairs::Attributes::StcaCurrentAlerting, false, value)
      end

      # Add sector entity
      # @param id [String, nil] The entity ID (optional)
      # @yield [sector] Block for configuring the sector
      # @yieldparam sector [Eccairs::Entities::Sector] The entity instance
      # @return [Eccairs::Entities::Sector] The created entity instance
      # @note Entity ID: 33, XML Tag: Sector
      def add_sector(id: nil, &block)
        add_entity(Eccairs::Entities::Sector, false, id: id, &block)
      end
    end
  end
end
