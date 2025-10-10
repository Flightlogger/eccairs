# frozen_string_literal: true

module Eccairs
  module Entities
    class Events < Eccairs::Base::Entity
      entity_id "14"
      xml_tag "Events"
      requires_id

      # Add event type
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::EventType] The created attribute instance
      # @note Attribute ID: 390, XML Tag: Event_Type
      def add_event_type(value)
        add_attribute(Eccairs::Attributes::EventType, false, value)
      end

      # Add phase
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::Phase] The created attribute instance
      # @note Attribute ID: 391, XML Tag: Phase
      def add_phase(value)
        add_attribute(Eccairs::Attributes::Phase, false, value)
      end
    end
  end
end
