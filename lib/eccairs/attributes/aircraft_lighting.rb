# frozen_string_literal: true

module Eccairs
  module Attributes
    class AircraftLighting < Eccairs::Base::EnumAttribute
      attribute_id 596
      xml_tag "Aircraft_Lighting"
      sequence 0
      allowed_values [1, 2, 4, 5, 6, 97, 98, 99]
    end
  end
end

