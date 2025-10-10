# frozen_string_literal: true

module Eccairs
  module Entities
    class SeparationTrafficInfoTypeQuality < Eccairs::Base::Entity
      entity_id "36"
      xml_tag "Separation_Traffic_Info_Type_Quality"

      # Add traffic info quality
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::TrafficInfoQuality] The created attribute instance
      # @note Attribute ID: 595, XML Tag: Traffic_Info_Quality
      def add_traffic_info_quality(value)
        add_attribute(Eccairs::Attributes::TrafficInfoQuality, false, value)
      end
    end
  end
end
