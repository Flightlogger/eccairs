# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module RiskAssessment
        module Attributes
          class Protections < Eccairs::BaseEntity
            attribute_id 1104
            xml_tag "Protections"
            sequence 14
            validates_inclusion within: [1, 2, 3, 4, 5, 6]
          end
        end
      end
    end
  end
end
