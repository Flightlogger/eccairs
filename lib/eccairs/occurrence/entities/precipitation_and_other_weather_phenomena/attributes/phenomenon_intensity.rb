# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module PrecipitationAndOtherWeatherPhenomena
        module Attributes
          class PhenomenonIntensity < Eccairs::BaseEntity
            attribute_id 230
            xml_tag "Phenomenon_Intensity"
            sequence 0
            validates_inclusion within: [97, 1, 2, 3, 99]
          end
        end
      end
    end
  end
end
