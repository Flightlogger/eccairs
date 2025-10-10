# frozen_string_literal: true

module Eccairs
  module Attributes
    class AerodromeLongitude < Eccairs::Base::DecimalAttribute
      attribute_id 2
      xml_tag "Aerodrome_Longitude"
      sequence 1
      min(-180.0)
      max 180.0
    end
  end
end
