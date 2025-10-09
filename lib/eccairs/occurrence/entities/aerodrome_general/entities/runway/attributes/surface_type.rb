# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AerodromeGeneral
        module Entities
          module Runway
            module Attributes
              class SurfaceType < Eccairs::Base::EnumEntity
                attribute_id 509
                xml_tag "Surface_Type"
                sequence 1

                allowed_values(
                  VALUE_1: 1,
                  VALUE_2: 2,
                  VALUE_3: 3,
                  VALUE_4: 4,
                  VALUE_5: 5,
                  VALUE_6: 6,
                  NOT_REPORTED: 98,
                  UNKNOWN: 99
        )
              end
            end
          end
        end
      end
    end
  end
end
