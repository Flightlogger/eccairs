# frozen_string_literal: true

module Eccairs
  module Attributes
    class AirTemperature < Eccairs::Base::DecimalAttribute
      attribute_id 287
      xml_tag "Air_Temperature"
      sequence 8
      unit "C"
      min(-1000)
      max 100000
    end
  end
end
