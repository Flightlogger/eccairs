# frozen_string_literal: true

module Eccairs
  module Attributes
    class Airspeed < Eccairs::Base::DecimalAttribute
      attribute_id 292
      xml_tag "Airspeed"
      sequence 0
      unit "kt"
      min(-999999)
      max 999999
    end
  end
end

