# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module GroundHandling
        module Attributes
          class LocationOnGround < Eccairs::Base::EnumEntity
            attribute_id 1118
            xml_tag "Location_On_Ground"
            sequence 3
            allowed_values [6, 17, 16, 9, 18, 20, 11, 27, 29, 14, 5, 21, 19, 3, 23, 24, 25, 22, 26, 4, 15, 10, 13, 8, 7, 2, 28, 1]
          end
        end
      end
    end
  end
end
