# frozen_string_literal: true

module Eccairs
  module Attributes
    class SsrMode < Eccairs::Base::EnumAttribute
      attribute_id 278
      xml_tag "SSR_Mode"
      sequence 37
      allowed_values [1, 2, 3, 97, 98, 99]
    end
  end
end
