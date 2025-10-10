# frozen_string_literal: true

module Eccairs
  module Attributes
    class VisibRestrictions < Eccairs::Base::EnumAttribute
      attribute_id "311"
      xml_tag "Visib_Restrictions"
      sequence 42
      allowed_values(
        NONE: 1,
        RAIN: 2,
        SNOW: 3,
        FOG: 4,
        MIST: 5,
        HAZE: 6,
        SMOKE: 7,
        DUST: 8,
        SAND: 9,
        OTHER: 10,
        UNKNOWN: 99
      )
    end
  end
end
