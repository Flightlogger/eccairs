# frozen_string_literal: true

module Eccairs
  module Attributes
    class BankAngle < Eccairs::Base::EnumAttribute
      attribute_id 567
      xml_tag "Bank_Angle"
      sequence 0
      allowed_values [1, 2, 3, 4, 5, 99]
    end
  end
end
