# frozen_string_literal: true

module Eccairs
  module Entities
    class Vehicle < Eccairs::Base::Entity
      entity_id "48"
      xml_tag "Vehicle"
      sequence 3
      requires_id
      # Vehicle attributes

      # Add type of vehicle
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::TypeOfVehicle] The created attribute instance
      # @note Attribute ID: 733, XML Tag: Type_Of_Vehicle
      def add_type_of_vehicle(value)
        add_attribute(Eccairs::Attributes::TypeOfVehicle, false, value)
      end

      # Add vehicle controlled
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::VehicleControlled] The created attribute instance
      # @note Attribute ID: 743, XML Tag: Vehicle_Controlled
      def add_vehicle_controlled(value)
        add_attribute(Eccairs::Attributes::VehicleControlled, false, value)
      end
    end
  end
end
