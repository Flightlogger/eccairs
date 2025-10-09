# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module RiskAssessment
        module Attributes
          class ErcsRowScore < Eccairs::BaseEntity
            attribute_id 1093
            xml_tag "ERCS_Row_Score"
            sequence 3
            validates_inclusion within: [1, 2, 3, 4, 5, 6]
          end
        end
      end
    end
  end
end
