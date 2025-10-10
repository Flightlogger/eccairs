# frozen_string_literal: true

module Eccairs
  module Attributes
    class EstMinimumHorizSep < Eccairs::Base::DecimalAttribute
      attribute_id 575
      xml_tag "Est_Minimum_Horiz_Sep"
      sequence 2
      unit "NM"
      min(-999999)
      max 999999
    end
  end
end
