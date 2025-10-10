# frozen_string_literal: true

module Eccairs
  module Attributes
    class PropInvolvement < Eccairs::Base::EnumAttribute
      attribute_id 896
      xml_tag "Prop_Involvement"
      sequence 5
      allowed_values [3, 4, 7, 6, 5, 8, 2, 1]
    end
  end
end
