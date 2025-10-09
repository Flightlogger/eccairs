# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class TotalCyclesAc < Eccairs::BaseEntity
            attribute_id 33
            xml_tag "Total_Cycles_A_C"
            sequence 5
            validates_numericality min: 0, max: 999999, type: :integer
          end
        end
      end
    end
  end
end
