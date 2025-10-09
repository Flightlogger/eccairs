# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module PrecipitationAndOtherWeatherPhenomena
        module Attributes
          class PhenomenonType < Eccairs::Base::Entity
            attribute_id 299
            xml_tag "Phenomenon_Type"
            sequence 1
            validates_inclusion within: [106, 1, 7, 3, 16, 4, 2, 19, 18, 107, 100, 15, 101, 17, 103, 104, 102, 108, 20, 11, 21, 14, 105, 10, 98, 99]
          end
        end
      end
    end
  end
end
