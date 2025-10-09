# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AerodromeGeneral
        module Attributes
          class ElevationAboveMsl < Eccairs::Base::DecimalEntity
            attribute_id 4
            xml_tag "Elevation_Above_MSL"
            sequence 3
            unit "ft"

            min -500


            max 10000
          end
        end
      end
    end
  end
end
