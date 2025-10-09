# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module RiskAssessment
        module Attributes
          class Unspecified < Eccairs::Base::Entity
            attribute_id 1105
            xml_tag "Unspecified"
            sequence 15
            validates_inclusion within: [1, 2, 3, 4, 5, 6]
          end
        end
      end
    end
  end
end
