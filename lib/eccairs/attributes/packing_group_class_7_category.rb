# frozen_string_literal: true

module Eccairs
  module Attributes
    class PackingGroupClass7Category < Eccairs::Base::EnumAttribute
      attribute_id 1057
      xml_tag "Packing_Group_Class_7_Category"
      sequence 7
      allowed_values [3, 4, 5, 6, 7, 8, 1, 2]
    end
  end
end
