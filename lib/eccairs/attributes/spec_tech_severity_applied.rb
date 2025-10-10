# frozen_string_literal: true

module Eccairs
  module Attributes
    class SpecTechSeverityApplied < Eccairs::Base::EnumAttribute
      attribute_id 1079
      xml_tag "Spec_Tech_Severity_Applied"
      sequence 47
      allowed_values(
        YES: 1,
        NO: 2,
        VALUE_3: 3
        )
    end
  end
end
