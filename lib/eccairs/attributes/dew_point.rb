# frozen_string_literal: true

module Eccairs
  module Attributes
    class DewPoint < Eccairs::Base::DecimalAttribute
      attribute_id 85
      xml_tag "Dew_Point"
      sequence 0
      unit "C"
      min(-100)
      max 100
    end
  end
end
