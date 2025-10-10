# frozen_string_literal: true

module Eccairs
  module Attributes
    class ReqMinimumHorizSep < Eccairs::Base::DecimalAttribute
      attribute_id 577
      xml_tag "Req_Minimum_Horiz_Sep"
      sequence 3
      unit "NM"
      min(-999999)
      max 999999
    end
  end
end
