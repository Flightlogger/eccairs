# frozen_string_literal: true

module Eccairs
  module Entities
    class RunwayIncursion < Eccairs::Base::Entity
      entity_id "47"
      xml_tag "Runway_Incursion"
      sequence 11

      # Add entity involved
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::EntityInvolved] The created attribute instance
      # @note Attribute ID: 741, XML Tag: Entity_Involved
      def add_entity_involved(value)
        add_attribute(Eccairs::Attributes::EntityInvolved, false, value)
      end
    end
  end
end
