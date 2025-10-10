# frozen_string_literal: true

module Eccairs
  module Attributes
    class RaType < Eccairs::Base::EnumAttribute
      attribute_id 610
      xml_tag "RA_Type"
      sequence 6
      allowed_values [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end
  end
end
