# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AerodromeGeneral
        module Attributes
          class ElevationAboveMsl < Eccairs::Base::Entity
            attribute_id 4
            xml_tag "Elevation_Above_MSL"
            sequence 3
            unit "ft"

            validates_numericality min: -500, max: 10000, type: :decimal
          end
        end
      end
    end
  end
end
