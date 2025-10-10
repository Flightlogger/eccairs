# frozen_string_literal: true

module Eccairs
  module Entities
    class RunwayIncursion < Eccairs::Base::Entity
      entity_id "47"
      xml_tag "Runway_Incursion"

      belongs_to :occurrence

      # Linked entities (references to entities defined elsewhere)
      # has_many :aircraft, class_name: "Eccairs::Entities::Aircraft"
      # has_many :runway, class_name: "Eccairs::Entities::Runway"
      # has_many :vehicle, class_name: "Eccairs::Entities::Vehicle"

      # Attributes
      has_many :entity_involved, class_name: "Eccairs::Attributes::EntityInvolved"
    end
  end
end
