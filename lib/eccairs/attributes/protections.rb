# frozen_string_literal: true

module Eccairs
  module Attributes
    class Protections < Eccairs::Base::EnumAttribute
      attribute_id 1104
      xml_tag "Protections"
      sequence 14
      allowed_values [1, 2, 3, 4, 5, 6]
    end
  end
end
