# frozen_string_literal: true

module Eccairs
  module Attributes
    class MinHorizSepRec < Eccairs::Base::DecimalAttribute
      attribute_id 579
      xml_tag "Min_Horiz_Sep_Rec"
      sequence 4
      unit "NM"
      min(-999999)
      max 999999
    end
  end
end
