# frozen_string_literal: true

module Eccairs
  module Attributes
    class SpecTechRepeatability < Eccairs::Base::EnumAttribute
      attribute_id 1081
      xml_tag "Spec_Tech_Repeatability"
      sequence 49
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
