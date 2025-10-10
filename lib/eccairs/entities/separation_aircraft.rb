# frozen_string_literal: true

module Eccairs
  module Entities
    class SeparationAircraft < Eccairs::Base::Entity
      entity_id "35"
      xml_tag "Separation_Aircraft"

      belongs_to :separation

      # Nested entities
      has_many :separation_traffic_info_type_quality, class_name: "Eccairs::Entities::SeparationTrafficInfoTypeQuality"

      # Linked entities (references to entities defined elsewhere)
      # has_many :aircraft, class_name: "Eccairs::Entities::Aircraft"

      # Attributes
      has_many :atm_action, class_name: "Eccairs::Attributes::AtmAction"
      has_many :a_c_avoiding_action, class_name: "Eccairs::Attributes::ACAvoidingAction"
      has_many :other_aircraft_seen, class_name: "Eccairs::Attributes::OtherAircraftSeen"
      has_many :risk_reduction_a_c, class_name: "Eccairs::Attributes::RiskReductionAC"
      has_many :height_altitude, class_name: "Eccairs::Attributes::HeightAltitude"
      has_many :vertical_profile_of_separation, class_name: "Eccairs::Attributes::VerticalProfileOfSeparation"
      has_many :ra_type, class_name: "Eccairs::Attributes::RaType"
      has_many :pilot_response_to_ra, class_name: "Eccairs::Attributes::PilotResponseToRa"
      has_many :ra_classification, class_name: "Eccairs::Attributes::RaClassification"
    end
  end
end
