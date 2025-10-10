# frozen_string_literal: true

module Eccairs
  module Attributes
    class RaClassification < Eccairs::Base::EnumAttribute
      attribute_id 613
      xml_tag "RA_Classification"
      sequence 8
      allowed_values [1, 2, 3, 4, 5]
    end
  end
end
