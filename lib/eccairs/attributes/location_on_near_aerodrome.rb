# frozen_string_literal: true

module Eccairs
  module Attributes
    class LocationOnNearAerodrome < Eccairs::Base::EnumAttribute
      attribute_id 641
      xml_tag "Location_On_Near_Aerodrome"
      sequence 9
      allowed_values [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 99]
    end
  end
end
