# frozen_string_literal: true

module Eccairs
  module Attributes
    class ErcsCalculatedBS < Eccairs::Base::IntegerAttribute
      attribute_id 1106
      xml_tag "ERCS_Calculated_B_S"
      sequence 16
      min 0
      max 999999
    end
  end
end
