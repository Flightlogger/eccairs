# frozen_string_literal: true

module Eccairs
  module Attributes
    class EffectOnAtmService < Eccairs::Base::EnumAttribute
      attribute_id 436
      xml_tag "Effect_On_ATM_Service"
      sequence 18
      allowed_values(
        VALUE_4: 4,
        VALUE_3: 3,
        NO: 2,
        YES: 1,
        VALUE_5: 5,
        VALUE_7: 7,
        VALUE_6: 6
        )
    end
  end
end
