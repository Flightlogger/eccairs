# frozen_string_literal: true

module Eccairs
  module Attributes
    class TurbulenceIntensity < Eccairs::Base::EnumAttribute
      attribute_id 293
      xml_tag "Turbulence_Intensity"
      sequence 40
      allowed_values [97, 1, 2, 3, 99]
    end
  end
end
