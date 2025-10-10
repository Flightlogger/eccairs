# frozen_string_literal: true

module Eccairs
  module Attributes
    class OverallSeverity < Eccairs::Base::EnumAttribute
      attribute_id 1077
      xml_tag "Overall_Severity"
      sequence 45
      allowed_values(
        YES: 1,
        NO: 2,
        VALUE_3: 3,
        VALUE_4: 4,
        VALUE_5: 5,
        VALUE_7: 7,
        VALUE_8: 8
      )
    end
  end
end
