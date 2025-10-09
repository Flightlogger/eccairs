# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AerodromeGeneral
        module Attributes
          class AerodromeType < Eccairs::BaseEntity
            attribute_id 10
            xml_tag "Aerodrome_Type"
            sequence 8
            validates_inclusion within: {
              AERODROME: 1,
              HELIPORT: 2,
              UNKNOWN: 99
            }
          end
        end
      end
    end
  end
end
