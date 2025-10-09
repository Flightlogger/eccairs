# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module RiskAssessment
        module Attributes
          class RecoveryAction < Eccairs::Base::EnumEntity
            attribute_id 1103
            xml_tag "Recovery_Action"
            sequence 13
            allowed_values [1, 2, 3, 4, 5, 6]
          end
        end
      end
    end
  end
end
