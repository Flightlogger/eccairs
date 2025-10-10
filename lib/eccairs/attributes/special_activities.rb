# frozen_string_literal: true

module Eccairs
  module Attributes
    class SpecialActivities < Eccairs::Base::EnumAttribute
      attribute_id 17
      xml_tag "Special_Activities"
      sequence 4
      allowed_values [1, 2, 3, 4, 5, 6, 98, 99, 100, 101, 102, 103, 104]
    end
  end
end
