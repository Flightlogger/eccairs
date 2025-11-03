# frozen_string_literal: true

module Eccairs
  module Attributes
    class EngineTimeSinceOverhaul < Eccairs::Base::DecimalAttribute
      attribute_id 389
      xml_tag "Time_Since_Overhaul"
      sequence 1
      unit "Hour(s)"
      min 0
      max 999999
    end
  end
end
