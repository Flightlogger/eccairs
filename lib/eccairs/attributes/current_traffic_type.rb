# frozen_string_literal: true

module Eccairs
  module Attributes
    class CurrentTrafficType < Eccairs::Base::EnumAttribute
      attribute_id 29
      xml_tag "Current_Traffic_Type"
      sequence 3
      allowed_values [2, 1, 99]
    end
  end
end
