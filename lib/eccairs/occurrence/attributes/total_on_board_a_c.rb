# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class TotalOnBoardAC < Eccairs::Base::IntegerEntity
        attribute_id 462
        xml_tag "Total_On_Board_A_C"
        sequence 31

        min 0

        max 100000
      end
    end
  end
end
