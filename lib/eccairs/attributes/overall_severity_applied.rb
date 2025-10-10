# frozen_string_literal: true

module Eccairs
  module Attributes
    class OverallSeverityApplied < Eccairs::Base::EnumAttribute
      attribute_id 1076
      xml_tag "Overall_Severity_Applied"
      sequence 44
      allowed_values(
        YES: 1,
        NO: 2,
        VALUE_3: 3
      )
    end
  end
end
