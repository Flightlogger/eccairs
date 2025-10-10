# frozen_string_literal: true

module Eccairs
  module Attributes
    class SpecTechSeverity < Eccairs::Base::EnumAttribute
      attribute_id 1080
      xml_tag "Spec_Tech_Severity"
      sequence 48
      allowed_values(
        YES: 1,
        NO: 2,
        VALUE_3: 3,
        VALUE_4: 4,
        VALUE_5: 5,
        VALUE_6: 6,
        VALUE_8: 8,
        VALUE_7: 7
        )
    end
  end
end
