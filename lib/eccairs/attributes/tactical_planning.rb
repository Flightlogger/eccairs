# frozen_string_literal: true

module Eccairs
  module Attributes
    class TacticalPlanning < Eccairs::Base::EnumAttribute
      attribute_id 1099
      xml_tag "Tactical_Planning"
      sequence 9
      allowed_values [1, 2, 3, 4, 5, 6]
    end
  end
end
