# frozen_string_literal: true

module Eccairs
  module Attributes
    class OccurrenceCategory < Eccairs::Base::EnumAttribute
      attribute_id 430
      xml_tag "Occurrence_Category"
      sequence 14
      allowed_values(
        VALUE_24: 24,
        YES: 1,
        NO: 2,
        VALUE_25: 25,
        VALUE_29: 29,
        VALUE_26: 26,
        VALUE_3: 3,
        VALUE_102: 102,
        VALUE_4: 4,
        VALUE_101: 101,
        VALUE_5: 5,
        VALUE_6: 6,
        VALUE_7: 7,
        VALUE_9: 9,
        VALUE_104: 104,
        VALUE_10: 10,
        VALUE_11: 11,
        VALUE_12: 12,
        VALUE_13: 13,
        VALUE_103: 103,
        VALUE_14: 14,
        VALUE_105: 105,
        VALUE_106: 106,
        NOT_REPORTED: 98,
        VALUE_8: 8,
        VALUE_15: 15,
        VALUE_28: 28,
        VALUE_18: 18,
        VALUE_19: 19,
        VALUE_20: 20,
        VALUE_21: 21,
        VALUE_100: 100,
        UNKNOWN: 99,
        VALUE_22: 22,
        VALUE_27: 27,
        VALUE_23: 23
      )
    end
  end
end
