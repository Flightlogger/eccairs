# frozen_string_literal: true

module Eccairs
  module Attributes
    class RestBeforeDuty < Eccairs::Base::DecimalAttribute
      attribute_id 408
      xml_tag "Rest_Before_Duty"
      sequence 2
      unit "Hour(s)"
      min(-999999)
      max 999999
    end
  end
end
