# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module RiskAssessment
        module Attributes
          class RegulationsProceduresAndCompliance < Eccairs::Base::Entity
            attribute_id 1100
            xml_tag "Regulations_Procedures_And_Compliance"
            sequence 10
            validates_inclusion within: [1, 2, 3, 4, 5, 6]
          end
        end
      end
    end
  end
end
