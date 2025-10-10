# frozen_string_literal: true

module Eccairs
  module Attributes
    class TypeOfVehicle < Eccairs::Base::EnumAttribute
      attribute_id 733
      xml_tag "Type_Of_Vehicle"
      sequence 0
      allowed_values [1, 2, 3, 4, 5, 6, 8, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 35, 48, 49, 50]
    end
  end
end
