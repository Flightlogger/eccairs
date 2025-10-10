# frozen_string_literal: true

module Eccairs
  module Entities
    class SeparationTrafficInfoTypeQuality < Eccairs::Base::Entity
      entity_id "36"
      xml_tag "Separation_Traffic_Info_Type_Quality"

      belongs_to :separation_aircraft

      # Attributes
      has_many :traffic_info_quality, class_name: "Eccairs::Attributes::TrafficInfoQuality"
    end
  end
end

