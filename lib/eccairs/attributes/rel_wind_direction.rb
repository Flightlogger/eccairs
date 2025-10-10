# frozen_string_literal: true

module Eccairs
  module Attributes
    class RelWindDirection < Eccairs::Base::EnumAttribute
      attribute_id 245
      xml_tag "Rel_Wind_Direction"
      sequence 31
      allowed_values [3, 1, 4, 5, 2, 99]
    end
  end
end
