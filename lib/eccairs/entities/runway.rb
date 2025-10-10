# frozen_string_literal: true

module Eccairs
  module Entities
    class Runway < Eccairs::Base::Entity
      entity_id "31"
      xml_tag "Runway"
      requires_id
      # Runway attributes

      # Add runway identifier
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::RunwayIdentifier] The created attribute instance
      # @note Attribute ID: 499, XML Tag: Runway_Identifier
      def add_runway_identifier(value)
        add_attribute(Eccairs::Attributes::RunwayIdentifier, false, value)
      end

      # Add runway number
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::RunwayNumber] The created attribute instance
      # @note Attribute ID: 1119, XML Tag: Runway_Number
      def add_runway_number(value)
        add_attribute(Eccairs::Attributes::RunwayNumber, false, value)
      end

      # Add surface type
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::SurfaceType] The created attribute instance
      # @note Attribute ID: 509, XML Tag: Surface_Type
      def add_surface_type(value)
        add_attribute(Eccairs::Attributes::SurfaceType, false, value)
      end
    end
  end
end
