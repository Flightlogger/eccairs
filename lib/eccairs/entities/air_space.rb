# frozen_string_literal: true

module Eccairs
  module Entities
    class AirSpace < Eccairs::Base::Entity
      entity_id "3"
      xml_tag "Air_Space"
      requires_id

      # Add airspace class
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::AirspaceClass] The created attribute instance
      # @note Attribute ID: 13, XML Tag: Airspace_Class
      def add_airspace_class(value)
        add_attribute(Eccairs::Attributes::AirspaceClass, false, value)
      end

      # Add airspace name
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::AirspaceName] The created attribute instance
      # @note Attribute ID: 14, XML Tag: Airspace_Name
      def add_airspace_name(value)
        add_attribute(Eccairs::Attributes::AirspaceName, false, value)
      end

      # Add airspace type
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::AirspaceType] The created attribute instance
      # @note Attribute ID: 15, XML Tag: Airspace_Type
      def add_airspace_type(value)
        add_attribute(Eccairs::Attributes::AirspaceType, false, value)
      end

      # Add fir uir name
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::FirUirName] The created attribute instance
      # @note Attribute ID: 16, XML Tag: FIR_UIR_Name
      def add_fir_uir_name(value)
        add_attribute(Eccairs::Attributes::FirUirName, false, value)
      end

      # Add special activities
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::SpecialActivities] The created attribute instance
      # @note Attribute ID: 17, XML Tag: Special_Activities
      def add_special_activities(value)
        add_attribute(Eccairs::Attributes::SpecialActivities, false, value)
      end
    end
  end
end
