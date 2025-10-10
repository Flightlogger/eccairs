# frozen_string_literal: true

module Eccairs
  module Attributes
    class RiskGrade < Eccairs::Base::EnumAttribute
      attribute_id 718
      xml_tag "Risk_Grade"
      sequence 0
      allowed_values [1, 2, 3]
    end
  end
end
