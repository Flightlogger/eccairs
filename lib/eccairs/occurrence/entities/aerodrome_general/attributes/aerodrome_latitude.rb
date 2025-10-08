# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AerodromeGeneral
        module Attributes
          class AerodromeLatitude < Eccairs::BaseEntity
            attribute_id 1
            xml_tag "Aerodrome_Latitude"
            sequence 0
            validates_numericality min: -90.0, max: 90.0, type: :decimal
          end
        end
      end
    end
  end
end
