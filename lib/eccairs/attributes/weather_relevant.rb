# frozen_string_literal: true

module Eccairs
  module Attributes
    class WeatherRelevant < Eccairs::Base::EnumAttribute
      attribute_id 606
      xml_tag "Weather_Relevant"
      sequence 38
      allowed_values(
        YES: 1,
        NO: 2,
        UNKNOWN: 99
      )
    end
  end
end
