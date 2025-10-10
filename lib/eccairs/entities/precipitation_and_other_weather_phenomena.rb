# frozen_string_literal: true

module Eccairs
  module Entities
    class PrecipitationAndOtherWeatherPhenomena < Eccairs::Base::Entity
      entity_id "28"
      xml_tag "Precipitation_And_Other_Weather_Phenomena"

      belongs_to :occurrence

      # Attributes
      has_many :phenomenon_intensity, class_name: "Eccairs::Attributes::PhenomenonIntensity"
      has_many :phenomenon_type, class_name: "Eccairs::Attributes::PhenomenonType"
    end
  end
end
