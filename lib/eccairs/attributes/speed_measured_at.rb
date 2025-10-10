# frozen_string_literal: true

module Eccairs
  module Attributes
    class SpeedMeasuredAt < Eccairs::Base::EnumAttribute
      attribute_id 275
      xml_tag "Speed_Measured_At"
      sequence 7
      allowed_values(
        NO: 2,
        YES: 1,
        UNKNOWN: 99
        )
    end
  end
end
