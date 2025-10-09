# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module RiskAssessment
        module Attributes
          class ErcsColumnScore < Eccairs::BaseEntity
            attribute_id 1094
            xml_tag "ERCS_Column_Score"
            sequence 4
            validates_numericality min: 0, max: 999999, type: :integer
          end
        end
      end
    end
  end
end
