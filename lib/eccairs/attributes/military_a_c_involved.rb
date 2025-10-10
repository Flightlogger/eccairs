# frozen_string_literal: true

module Eccairs
  module Attributes
    class MilitaryACInvolved < Eccairs::Base::EnumAttribute
      attribute_id 574
      xml_tag "Military_A_C_Involved"
      sequence 1
      allowed_values [1, 2, 99]
    end
  end
end
