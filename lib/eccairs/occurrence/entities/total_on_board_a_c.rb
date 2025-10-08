# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      class TotalOnBoardAC < BaseEntity
        attribute_id 462
        xml_tag "Total_On_Board_A_C"
        sequence 31
        validates_numericality min: 0, max: 100000, type: :integer
      end
    end
  end
end
