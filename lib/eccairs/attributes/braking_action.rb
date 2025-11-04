# frozen_string_literal: true

module Eccairs
  module Attributes
    class BrakingAction < Eccairs::Base::EnumAttribute
      attribute_id 498
      xml_tag "Braking_Action"
      sequence 10
      allowed_values [1, 2, 3, 4, 99]
    end
  end
end
