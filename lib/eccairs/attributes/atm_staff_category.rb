# frozen_string_literal: true

module Eccairs
  module Attributes
    class AtmStaffCategory < Eccairs::Base::EnumAttribute
      attribute_id "357"
      xml_tag "Category"
      sequence 2
      allowed_values [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 97, 98, 99]
    end
  end
end
