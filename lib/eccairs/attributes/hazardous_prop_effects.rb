# frozen_string_literal: true

module Eccairs
  module Attributes
    class HazardousPropEffects < Eccairs::Base::EnumAttribute
      attribute_id 946
      xml_tag "Hazardous_Prop_Effects"
      sequence 15
      allowed_values [1, 2, 3, 4, 6, 5]
    end
  end
end
