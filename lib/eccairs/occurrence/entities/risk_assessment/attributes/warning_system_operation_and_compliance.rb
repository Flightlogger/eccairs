# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module RiskAssessment
        module Attributes
          class WarningSystemOperationAndCompliance < Eccairs::BaseEntity
            attribute_id 1102
            xml_tag "Warning_System_Operation_And_Compliance"
            sequence 12
            validates_inclusion within: [1, 2, 3, 4, 5, 6]
          end
        end
      end
    end
  end
end
