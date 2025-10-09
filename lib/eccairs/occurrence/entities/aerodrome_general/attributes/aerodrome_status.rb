# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AerodromeGeneral
        module Attributes
          class AerodromeStatus < Eccairs::Base::EnumEntity
            attribute_id 7
            xml_tag "Aerodrome_Status"
            sequence 5
            allowed_values [1, 2, 3, 4, 5, 6, 98, 99]
          end
        end
      end
    end
  end
end
