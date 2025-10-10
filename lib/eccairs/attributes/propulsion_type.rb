# frozen_string_literal: true

module Eccairs
  module Attributes
    class PropulsionType < Eccairs::Base::EnumAttribute
      attribute_id 232
      xml_tag "Propulsion_Type"
      sequence 29
      allowed_values [100, 1, 2, 5, 4, 3, 97, 98, 101, 99]
    end
  end
end
