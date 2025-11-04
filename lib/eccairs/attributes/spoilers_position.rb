# frozen_string_literal: true

module Eccairs
  module Attributes
    class SpoilersPosition < Eccairs::Base::EnumAttribute
      attribute_id 807
      xml_tag "Spoilers_Position"
      sequence 56
      allowed_values [1, 2, 3]
    end
  end
end
