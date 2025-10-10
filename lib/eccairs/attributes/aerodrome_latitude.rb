# frozen_string_literal: true

module Eccairs
  module Attributes
    class AerodromeLatitude < Eccairs::Base::DecimalAttribute
      attribute_id 1
      xml_tag "Aerodrome_Latitude"
      sequence 0
      min(-90.0)
      max 90.0
    end
  end
end
