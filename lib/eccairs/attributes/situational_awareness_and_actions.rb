# frozen_string_literal: true

module Eccairs
  module Attributes
    class SituationalAwarenessAndActions < Eccairs::Base::EnumAttribute
      attribute_id 1101
      xml_tag "Situational_Awareness_And_Actions"
      sequence 11
      allowed_values [1, 2, 3, 4, 5, 6]
    end
  end
end
