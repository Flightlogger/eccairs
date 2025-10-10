# frozen_string_literal: true

module Eccairs
  module Attributes
    class TotalCyclesAc < Eccairs::Base::IntegerAttribute
      attribute_id 33
      xml_tag "Total_Cycles_A_C"
      sequence 5
      min 0
      max 999999
    end
  end
end
