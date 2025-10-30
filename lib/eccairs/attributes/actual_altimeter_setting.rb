# frozen_string_literal: true

module Eccairs
  module Attributes
    class ActualAltimeterSetting < Eccairs::Base::DecimalAttribute
      attribute_id 23
      xml_tag "Actual_Altimeter_Setting"
      sequence 0
      unit "hPa"
      min(-3000)
      max(99999)
    end
  end
end
