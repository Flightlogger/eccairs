# frozen_string_literal: true

module Eccairs
  module Attributes
    class PartsStruck < Eccairs::Base::EnumAttribute
      attribute_id 644
      xml_tag "Parts_Struck"
      sequence 47
      allowed_values [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 16, 15]
    end
  end
end
