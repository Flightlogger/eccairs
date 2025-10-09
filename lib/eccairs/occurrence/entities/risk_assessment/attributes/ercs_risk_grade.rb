# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module RiskAssessment
        module Attributes
          class ErcsRiskGrade < Eccairs::Base::EnumEntity
            attribute_id 1109
            xml_tag "ERCS_Risk_Grade"
            sequence 18
            allowed_values [1, 2, 3]
          end
        end
      end
    end
  end
end
