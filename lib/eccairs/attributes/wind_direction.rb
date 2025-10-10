# frozen_string_literal: true

module Eccairs
  module Attributes
    class WindDirection < Eccairs::Base::DecimalAttribute
      attribute_id 320
      xml_tag "Wind_Direction"
      sequence 10
      unit "Degree(s)"
      min(-1000)
      max 100000
    end
  end
end
