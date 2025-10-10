# frozen_string_literal: true

module Eccairs
  module Attributes
    class WindSpeed < Eccairs::Base::DecimalAttribute
      attribute_id 322
      xml_tag "Wind_Speed"
      sequence 12
      unit "kt"
      min(-1000)
      max 100000
    end
  end
end
