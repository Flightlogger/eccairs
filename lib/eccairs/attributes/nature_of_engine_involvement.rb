# frozen_string_literal: true

module Eccairs
  module Attributes
    class NatureOfEngineInvolvement < Eccairs::Base::EnumAttribute
      attribute_id 654
      xml_tag "Nature_Of_Engine_Involvement"
      sequence 3
      allowed_values [3, 4, 7, 6, 5, 8, 2, 1]
    end
  end
end
