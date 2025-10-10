# frozen_string_literal: true

module Eccairs
  module Entities
    class Runway < Eccairs::Base::Entity
      entity_id "31"
      xml_tag "Runway"
      requires_id

      belongs_to :aerodrome_general

      # Runway attributes
      has_many :runway_identifier, class_name: "Eccairs::Attributes::RunwayIdentifier"
      has_many :runway_number, class_name: "Eccairs::Attributes::RunwayNumber"
      has_many :surface_type, class_name: "Eccairs::Attributes::SurfaceType"
    end
  end
end

