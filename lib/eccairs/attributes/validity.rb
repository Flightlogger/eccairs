# frozen_string_literal: true

module Eccairs
  module Attributes
    class Validity < Eccairs::Base::EnumAttribute
      attribute_id 397
      xml_tag "Validity"
      sequence 0
      allowed_values [1, 2, 97, 99]
    end
  end
end
