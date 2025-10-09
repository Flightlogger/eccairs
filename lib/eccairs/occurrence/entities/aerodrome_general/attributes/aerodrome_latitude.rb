# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AerodromeGeneral
        module Attributes
          class AerodromeLatitude < Eccairs::Base::DecimalEntity
            attribute_id 1
            xml_tag "Aerodrome_Latitude"
            sequence 0

            min(-90.0)

            max 90.0
          end
        end
      end
    end
  end
end
