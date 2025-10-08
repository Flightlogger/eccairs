# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      class ObjectDamaged < BaseEntity
        attribute_id 640
        xml_tag "Object_Damaged"
        sequence 39
        validates_inclusion within: {
          NO: 2,
          VALUE_6: 6,
          VALUE_7: 7,
          VALUE_8: 8,
          VALUE_9: 9,
          VALUE_10: 10,
          VALUE_11: 11,
          VALUE_12: 12,
          VALUE_13: 13,
          VALUE_14: 14,
          VALUE_15: 15,
          VALUE_3: 3,
          VALUE_16: 16,
          VALUE_17: 17,
          VALUE_18: 18,
          VALUE_19: 19,
          VALUE_4: 4,
          VALUE_20: 20,
          VALUE_21: 21,
          VALUE_5: 5,
          YES: 1
        }
      end
    end
  end
end
