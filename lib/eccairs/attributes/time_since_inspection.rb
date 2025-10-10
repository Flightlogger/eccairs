# frozen_string_literal: true

module Eccairs
  module Attributes
    class TimeSinceInspection < Eccairs::Base::DecimalAttribute
      attribute_id 901
      xml_tag "Time_Since_Inspection"
      sequence 8
      unit "Hour(s)"
      min(-999999)
      max 999999
    end
  end
end
