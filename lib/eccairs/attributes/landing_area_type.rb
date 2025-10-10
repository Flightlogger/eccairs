# frozen_string_literal: true

module Eccairs
  module Attributes
    class LandingAreaType < Eccairs::Base::EnumAttribute
      attribute_id 9
      xml_tag "Landing_Area_Type"
      sequence 7
      allowed_values [1, 2, 3, 4, 5, 6, 7, 99]
    end
  end
end
