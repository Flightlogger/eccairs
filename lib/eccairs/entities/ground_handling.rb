# frozen_string_literal: true

module Eccairs
  module Entities
    class GroundHandling < Eccairs::Base::Entity
      entity_id "60"
      xml_tag "Ground_Handling"

      belongs_to :occurrence

      # Attributes
      has_many :gh_organisation, class_name: "Eccairs::Attributes::GhOrganisation"
      has_many :gh_type_of_service, class_name: "Eccairs::Attributes::GhTypeOfService"
      has_many :location_on_ground, class_name: "Eccairs::Attributes::LocationOnGround"
      has_many :type_of_equipment_involved, class_name: "Eccairs::Attributes::TypeOfEquipmentInvolved"
      has_many :type_of_ground_staff, class_name: "Eccairs::Attributes::TypeOfGroundStaff"
    end
  end
end
