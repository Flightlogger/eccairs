# frozen_string_literal: true

module Eccairs
  module Attributes
    class EngineTimeSinceNew < Eccairs::Base::DecimalAttribute
      attribute_id 883
      xml_tag "Time_Since_New"
      sequence 6
      unit "Hour(s)"
      min(-999999)
      max 999999
    end
  end
end
