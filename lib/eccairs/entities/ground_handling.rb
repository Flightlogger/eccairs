# frozen_string_literal: true

module Eccairs
  module Entities
    class GroundHandling < Eccairs::Base::Entity
      entity_id "60"
      xml_tag "Ground_Handling"

      # Add gh organisation
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::GhOrganisation] The created attribute instance
      # @note Attribute ID: 1116, XML Tag: GH_Organisation
      def add_gh_organisation(value)
        add_attribute(Eccairs::Attributes::GhOrganisation, false, value)
      end

      # Add gh type of service
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::GhTypeOfService] The created attribute instance
      # @note Attribute ID: 1115, XML Tag: GH_Type_Of_Service
      def add_gh_type_of_service(value)
        add_attribute(Eccairs::Attributes::GhTypeOfService, false, value)
      end

      # Add location on ground
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::LocationOnGround] The created attribute instance
      # @note Attribute ID: 1118, XML Tag: Location_On_Ground
      def add_location_on_ground(value)
        add_attribute(Eccairs::Attributes::LocationOnGround, false, value)
      end

      # Add type of equipment involved
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::TypeOfEquipmentInvolved] The created attribute instance
      # @note Attribute ID: 1120, XML Tag: Type_Of_Equipment_Involved
      def add_type_of_equipment_involved(value)
        add_attribute(Eccairs::Attributes::TypeOfEquipmentInvolved, false, value)
      end

      # Add type of ground staff
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::TypeOfGroundStaff] The created attribute instance
      # @note Attribute ID: 1117, XML Tag: Type_of_Ground_staff
      def add_type_of_ground_staff(value)
        add_attribute(Eccairs::Attributes::TypeOfGroundStaff, false, value)
      end
    end
  end
end
