# frozen_string_literal: true

module Eccairs
  module Attributes
    class RiskMethod < Eccairs::Base::EnumAttribute
      attribute_id 939
      xml_tag "Risk_Method"
      sequence 1
      allowed_values [1, 8, 5, 6, 9, 7, 3, 2, 10, 4]
    end
  end
end
