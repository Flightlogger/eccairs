# frozen_string_literal: true

module Eccairs
  module Attributes
    class SpeedAtImpact < Eccairs::Base::DecimalAttribute
      attribute_id 272
      xml_tag "Speed_At_Impact"
      sequence 0
      unit "kt"
      min(-999999)
      max 999999
    end
  end
end
