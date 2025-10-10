# frozen_string_literal: true

module Eccairs
  module Attributes
    class ErcsNumericalEquivalentScore < Eccairs::Base::DecimalAttribute
      attribute_id 1096
      xml_tag "ERCS_Numerical_Equivalent_Score"
      sequence 6
      min(-999999)
      max 999999
    end
  end
end
