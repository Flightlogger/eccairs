# frozen_string_literal: true

module Eccairs
  module Attributes
    class HeightAltitude < Eccairs::Base::DecimalAttribute
      attribute_id 597
      xml_tag "Height_Altitude"
      sequence 4
      unit "ft"
      min(-999999)
      max 999999
    end
  end
end
