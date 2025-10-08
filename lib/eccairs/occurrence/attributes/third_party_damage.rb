# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class ThirdPartyDamage < Eccairs::BaseEntity
        attribute_id 456
        xml_tag "Third_Party_Damage"
        sequence 28
        validates_inclusion within: {
          YES: 1,
          VALUE_100: 100,
          VALUE_101: 101,
          VALUE_102: 102,
          VALUE_103: 103,
          VALUE_104: 104,
          VALUE_105: 105,
          VALUE_106: 106,
          VALUE_107: 107,
          NO: 2,
          UNKNOWN: 99
        }
      end
    end
  end
end
