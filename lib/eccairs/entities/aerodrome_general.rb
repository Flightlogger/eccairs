# frozen_string_literal: true

module Eccairs
  module Entities
    class AerodromeGeneral < Eccairs::Base::Entity
      entity_id "1"
      xml_tag "Aerodrome_General"

      belongs_to :occurrence

      # Aerodrome attributes
      has_many :aerodrome_latitude, class_name: "Eccairs::Attributes::AerodromeLatitude"
      has_many :aerodrome_longitude, class_name: "Eccairs::Attributes::AerodromeLongitude"
      has_many :aerodrome_status, class_name: "Eccairs::Attributes::AerodromeStatus"
      has_many :aerodrome_type, class_name: "Eccairs::Attributes::AerodromeType"
      has_many :area_configuration, class_name: "Eccairs::Attributes::AreaConfiguration"
      has_many :elevation_above_msl, class_name: "Eccairs::Attributes::ElevationAboveMsl"
      has_many :landing_area_type, class_name: "Eccairs::Attributes::LandingAreaType"
      has_many :location_indicator, class_name: "Eccairs::Attributes::LocationIndicator"
      has_many :location_on_near_aerodrome, class_name: "Eccairs::Attributes::LocationOnNearAerodrome"
      has_many :surface_type, class_name: "Eccairs::Attributes::SurfaceType"

      # Nested entities
      has_one :narrative, class_name: "Eccairs::Entities::AerodromeNarrative"
      has_many :runway, class_name: "Eccairs::Entities::Runway"
      has_many :vehicle, class_name: "Eccairs::Entities::Vehicle"
    end
  end
end
