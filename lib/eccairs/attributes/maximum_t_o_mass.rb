# frozen_string_literal: true

module Eccairs
  module Attributes
    class MaximumTOMass < Eccairs::Base::DecimalAttribute
      attribute_id "175"
      xml_tag "Maximum_T_O_Mass"
      sequence 22
      unit "kg"
    end
  end
end
