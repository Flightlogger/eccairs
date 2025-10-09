# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class DamageNotToAC < Eccairs::Base::EnumEntity
        attribute_id 448
        xml_tag "Damage_Not_To_A_C"
        sequence 22
        allowed_values(
          NOT_APPLICABLE: 97,
          NO: 2,
          YES: 1,
          UNKNOWN: 99
        )
      end
    end
  end
end
