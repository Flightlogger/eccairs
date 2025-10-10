# frozen_string_literal: true

module Eccairs
  module Attributes
    class AircraftAltitude < Eccairs::Base::DecimalAttribute
      attribute_id 22
      xml_tag "Aircraft_Altitude"
      sequence 1
      unit "ft"
      min(-999999)
      max 999999
    end
  end
end
