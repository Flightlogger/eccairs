# frozen_string_literal: true

module Eccairs
  module Attributes
    class ACOutOfService < Eccairs::Base::DecimalAttribute
      attribute_id 650
      xml_tag "A_C_Out_Of_Service"
      sequence 0
      unit "Hour(s)"
      min(0)
      max(99999)
    end
  end
end
