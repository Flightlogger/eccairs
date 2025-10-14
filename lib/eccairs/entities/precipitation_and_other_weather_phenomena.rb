# frozen_string_literal: true

module Eccairs
  module Entities
    class PrecipitationAndOtherWeatherPhenomena < Eccairs::Base::Entity
      entity_id "28"
      xml_tag "Precipitation_And_Other_Weather_Phenomena"
      sequence 8

      # Add phenomenon intensity
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::PhenomenonIntensity] The created attribute instance
      # @note Attribute ID: 230, XML Tag: Phenomenon_Intensity
      def add_phenomenon_intensity(value)
        add_attribute(Eccairs::Attributes::PhenomenonIntensity, false, value)
      end

      # Add phenomenon type
      # @param value [Object] The attribute value
      # @return [Eccairs::Attributes::PhenomenonType] The created attribute instance
      # @note Attribute ID: 299, XML Tag: Phenomenon_Type
      def add_phenomenon_type(value)
        add_attribute(Eccairs::Attributes::PhenomenonType, false, value)
      end
    end
  end
end
