# frozen_string_literal: true

module Eccairs
  module Attributes
    class LongitudeOfOcc < Eccairs::Base::DecimalAttribute
      attribute_id 444
      xml_tag "Longitude_Of_Occ"
      sequence 21
      min(-180.0)
      max 180.0
    end
  end
end
