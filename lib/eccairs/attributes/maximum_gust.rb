# frozen_string_literal: true

module Eccairs
  module Attributes
    class MaximumGust < Eccairs::Base::DecimalAttribute
      attribute_id 176
      xml_tag "Maximum_Gust"
      sequence 5
      unit "kt"
      min(-1000)
      max 100000
    end
  end
end
