# frozen_string_literal: true

module Eccairs
  module Attributes
    class PartsDamaged < Eccairs::Base::EnumAttribute
      attribute_id 643
      xml_tag "Parts_Damaged"
      sequence 46
      allowed_values [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 16, 15]
    end
  end
end
