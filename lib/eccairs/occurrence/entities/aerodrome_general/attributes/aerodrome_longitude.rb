# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AerodromeGeneral
        module Attributes
          class AerodromeLongitude < Eccairs::Base::DecimalEntity
            attribute_id 2
            xml_tag "Aerodrome_Longitude"
            sequence 1

            min(-180.0)

            max 180.0
          end
        end
      end
    end
  end
end
