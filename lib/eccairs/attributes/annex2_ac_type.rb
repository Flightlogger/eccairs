# frozen_string_literal: true

module Eccairs
  module Attributes
    class Annex2AcType < Eccairs::Base::EnumAttribute
      attribute_id 1090
      xml_tag "Annex_2_A_C_Type"
      sequence 55
      allowed_values [1, 11, 12, 2, 3, 4, 5, 13, 14, 15, 6, 7, 8, 9, 10, 16]
    end
  end
end
