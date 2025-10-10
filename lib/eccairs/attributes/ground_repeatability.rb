# frozen_string_literal: true

module Eccairs
  module Attributes
    class GroundRepeatability < Eccairs::Base::EnumAttribute
      attribute_id 1075
      xml_tag "Ground_Repeatability"
      sequence 43
      allowed_values(
        YES: 1,
        NO: 2,
        VALUE_3: 3,
        VALUE_4: 4,
        VALUE_5: 5
      )
    end
  end
end
