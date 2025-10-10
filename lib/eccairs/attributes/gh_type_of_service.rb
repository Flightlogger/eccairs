# frozen_string_literal: true

module Eccairs
  module Attributes
    class GhTypeOfService < Eccairs::Base::EnumAttribute
      attribute_id 1115
      xml_tag "GH_Type_Of_Service"
      sequence 0
      allowed_values [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
    end
  end
end
