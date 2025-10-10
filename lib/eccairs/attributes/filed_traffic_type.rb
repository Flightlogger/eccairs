# frozen_string_literal: true

module Eccairs
  module Attributes
    class FiledTrafficType < Eccairs::Base::EnumAttribute
      attribute_id 118
      xml_tag "Filed_Traffic_Type"
      sequence 15
      allowed_values [2, 1, 3, 99]
    end
  end
end
