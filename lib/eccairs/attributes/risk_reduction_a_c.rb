# frozen_string_literal: true

module Eccairs
  module Attributes
    class RiskReductionAC < Eccairs::Base::EnumAttribute
      attribute_id 591
      xml_tag "Risk_Reduction_A_C"
      sequence 3
      allowed_values [1, 2, 99]
    end
  end
end
