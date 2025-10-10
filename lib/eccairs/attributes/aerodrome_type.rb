# frozen_string_literal: true

module Eccairs
  module Attributes
    class AerodromeType < Eccairs::Base::EnumAttribute
      attribute_id 10
      xml_tag "Aerodrome_Type"
      sequence 8
      allowed_values(
        AERODROME: 1,
        HELIPORT: 2,
        UNKNOWN: 99
      )
    end
  end
end
