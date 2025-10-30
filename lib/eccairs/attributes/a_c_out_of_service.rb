# frozen_string_literal: true

module Eccairs
  module Attributes
    class ACOutOfService < Eccairs::Base::EnumAttribute
      attribute_id 650
      xml_tag "A_C_Out_Of_Service"
      sequence 0
      allowed_values(
        YES: 1,
        NO: 2,
        UNKNOWN: 99
      )
    end
  end
end
