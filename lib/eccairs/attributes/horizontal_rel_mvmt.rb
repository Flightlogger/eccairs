# frozen_string_literal: true

module Eccairs
  module Attributes
    class HorizontalRelMvmt < Eccairs::Base::EnumAttribute
      attribute_id 570
      xml_tag "Horizontal_Rel_Mvmt"
      sequence 0
      allowed_values [3, 1, 2, 4, 5, 6, 99]
    end
  end
end
