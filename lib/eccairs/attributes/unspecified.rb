# frozen_string_literal: true

module Eccairs
  module Attributes
    class Unspecified < Eccairs::Base::EnumAttribute
      attribute_id 1105
      xml_tag "Unspecified"
      sequence 15
      allowed_values [1, 2, 3, 4, 5, 6]
    end
  end
end
