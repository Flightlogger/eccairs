# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module RiskAssessment
        module Attributes
          class ErcsRiskGrade < Eccairs::Base::Entity
            attribute_id 1109
            xml_tag "ERCS_Risk_Grade"
            sequence 18
            validates_inclusion within: [1, 2, 3]
          end
        end
      end
    end
  end
end
