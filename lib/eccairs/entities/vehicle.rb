# frozen_string_literal: true

module Eccairs
  module Entities
    class Vehicle < Eccairs::Base::Entity
      entity_id "48"
      xml_tag "Vehicle"
      requires_id

      belongs_to :aerodrome_general

      # Vehicle attributes
      has_many :type_of_vehicle, class_name: "Eccairs::Attributes::TypeOfVehicle"
      has_many :vehicle_controlled, class_name: "Eccairs::Attributes::VehicleControlled"
    end
  end
end
