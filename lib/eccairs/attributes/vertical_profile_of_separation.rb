# frozen_string_literal: true

module Eccairs
  module Attributes
    class VerticalProfileOfSeparation < Eccairs::Base::EnumAttribute
      attribute_id 598
      xml_tag "Vertical_Profile_Of_Separation"
      sequence 5
      allowed_values [1, 2, 3, 99]
    end
  end
end
