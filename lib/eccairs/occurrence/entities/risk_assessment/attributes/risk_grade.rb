# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module RiskAssessment
        module Attributes
          class RiskGrade < Eccairs::Base::Entity
            attribute_id 718
            xml_tag "Risk_Grade"
            sequence 0
            validates_inclusion within: [1, 2, 3]
          end
        end
      end
    end
  end
end
