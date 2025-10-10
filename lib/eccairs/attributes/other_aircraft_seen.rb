# frozen_string_literal: true

module Eccairs
  module Attributes
    class OtherAircraftSeen < Eccairs::Base::EnumAttribute
      attribute_id 587
      xml_tag "Other_Aircraft_Seen"
      sequence 2
      allowed_values [1, 3, 2, 99]
    end
  end
end
