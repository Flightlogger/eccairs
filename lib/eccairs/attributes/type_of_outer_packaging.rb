# frozen_string_literal: true

module Eccairs
  module Attributes
    class TypeOfOuterPackaging < Eccairs::Base::EnumAttribute
      attribute_id 1056
      xml_tag "Type_Of_Outer_Packaging"
      sequence 6
      allowed_values (1..53).to_a
    end
  end
end
