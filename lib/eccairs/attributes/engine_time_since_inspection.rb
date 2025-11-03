# frozen_string_literal: true

module Eccairs
  module Attributes
    class EngineTimeSinceInspection < Eccairs::Base::DecimalAttribute
      attribute_id 884
      xml_tag "Time_Since_Inspection"
      sequence 7
      unit "Hour(s)"
      min 0
      max 999999
    end
  end
end
