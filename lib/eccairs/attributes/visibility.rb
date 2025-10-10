# frozen_string_literal: true

module Eccairs
  module Attributes
    class Visibility < Eccairs::Base::DecimalAttribute
      attribute_id 310
      xml_tag "Visibility"
      sequence 9
      unit "m"
      min(-1000)
      max 100000
    end
  end
end
