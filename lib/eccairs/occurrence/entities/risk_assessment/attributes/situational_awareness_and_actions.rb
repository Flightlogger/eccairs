# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module RiskAssessment
        module Attributes
          class SituationalAwarenessAndActions < Eccairs::Base::EnumEntity
            attribute_id 1101
            xml_tag "Situational_Awareness_And_Actions"
            sequence 11
            allowed_values [1, 2, 3, 4, 5, 6]
          end
        end
      end
    end
  end
end
