# frozen_string_literal: true

module Eccairs
  module Attributes
    class CloudAmount < Eccairs::Base::EnumAttribute
      attribute_id 266
      xml_tag "Cloud_Amount"
      sequence 6
      allowed_values(
        YES: 1,
        VALUE_101: 101,
        NO: 2,
        VALUE_6: 6,
        VALUE_3: 3,
        VALUE_4: 4,
        VALUE_5: 5,
        UNKNOWN: 99
      )
    end
  end
end
