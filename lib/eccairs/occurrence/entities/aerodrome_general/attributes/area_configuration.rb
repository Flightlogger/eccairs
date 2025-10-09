# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AerodromeGeneral
        module Attributes
          class AreaConfiguration < Eccairs::Base::EnumEntity
            attribute_id 3
            xml_tag "Area_Configuration"
            sequence 2
            allowed_values [1, 2, 3, 98, 99]
          end
        end
      end
    end
  end
end
