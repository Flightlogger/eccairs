# frozen_string_literal: true

module Eccairs
  module Attributes
    class ClearanceValidity < Eccairs::Base::EnumAttribute
      attribute_id 57
      xml_tag "Clearance_Validity"
      sequence 8
      allowed_values [6, 2, 99, 7]
    end
  end
end
