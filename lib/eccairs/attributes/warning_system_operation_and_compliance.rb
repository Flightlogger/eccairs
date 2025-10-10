# frozen_string_literal: true

module Eccairs
  module Attributes
    class WarningSystemOperationAndCompliance < Eccairs::Base::EnumAttribute
      attribute_id 1102
      xml_tag "Warning_System_Operation_And_Compliance"
      sequence 12
      allowed_values [1, 2, 3, 4, 5, 6]
    end
  end
end
