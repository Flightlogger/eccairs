# frozen_string_literal: true

module Eccairs
  module Attributes
    class DutyTimeInPosition < Eccairs::Base::DecimalAttribute
      attribute_id 347
      xml_tag "Duty_Time_In_Position"
      sequence 1
      unit "Hour(s)"
      min(-999999)
      max 999999
    end
  end
end
