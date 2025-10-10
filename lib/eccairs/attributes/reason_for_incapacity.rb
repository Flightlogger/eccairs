# frozen_string_literal: true

module Eccairs
  module Attributes
    class ReasonForIncapacity < Eccairs::Base::EnumAttribute
      attribute_id 419
      xml_tag "Reason_For_Incapacity"
      sequence 1
      allowed_values [4, 6, 7, 3, 10, 9, 8, 1, 2, 5, 97, 98, 99]
    end
  end
end
