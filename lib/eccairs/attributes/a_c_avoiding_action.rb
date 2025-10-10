# frozen_string_literal: true

module Eccairs
  module Attributes
    class ACAvoidingAction < Eccairs::Base::EnumAttribute
      attribute_id 566
      xml_tag "A_C_Avoiding_Action"
      sequence 1
      allowed_values [1, 4, 3, 2, 97, 99]
    end
  end
end
