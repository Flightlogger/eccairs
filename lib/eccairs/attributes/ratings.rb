# frozen_string_literal: true

module Eccairs
  module Attributes
    class Ratings < Eccairs::Base::EnumAttribute
      attribute_id 398
      xml_tag "Ratings"
      sequence 1
      allowed_values [1, 2, 3, 99]
    end
  end
end
