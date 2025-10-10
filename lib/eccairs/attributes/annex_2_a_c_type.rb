# frozen_string_literal: true

module Eccairs
  module Attributes
    class Annex2ACType < Eccairs::Base::EnumAttribute
      attribute_id "1090"
      xml_tag "Annex_2_A_C_Type"
      sequence 55
      allowed_values(
        LIGHTER_THAN_AIR: 1,
        LANDPLANE: 2,
        SEAPLANE: 3,
        AMPHIBIAN: 4,
        HELICOPTER: 5,
        GYROPLANE: 6,
        TILT_WING: 7,
        ORNITHOPTER: 8,
        OTHER: 9,
        UNKNOWN: 99
      )
    end
  end
end
