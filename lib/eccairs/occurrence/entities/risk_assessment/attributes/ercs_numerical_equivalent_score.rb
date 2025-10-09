# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module RiskAssessment
        module Attributes
          class ErcsNumericalEquivalentScore < Eccairs::Base::DecimalEntity
            attribute_id 1096
            xml_tag "ERCS_Numerical_Equivalent_Score"
            sequence 6

            min(-999999)

            max 999999
          end
        end
      end
    end
  end
end
