# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module RiskAssessment
        module Attributes
          class ErcsCalculatedBS < Eccairs::Base::IntegerEntity
            attribute_id 1106
            xml_tag "ERCS_Calculated_B_S"
            sequence 16

            min 0

            max 999999
          end
        end
      end
    end
  end
end
