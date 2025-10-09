# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class HighestDamage < Eccairs::Base::EnumEntity
        attribute_id 432
        xml_tag "Highest_Damage"
        sequence 16
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
end
