# frozen_string_literal: true

module Eccairs
  module Attributes
    class InjuryLevel < Eccairs::Base::EnumAttribute
      attribute_id 451
      xml_tag "Injury_Level"
      sequence 23
      allowed_values(
        YES: 1,
        NO: 2,
        VALUE_3: 3,
        NOT_REPORTED: 98,
        UNKNOWN: 99
      )
    end
  end
end
