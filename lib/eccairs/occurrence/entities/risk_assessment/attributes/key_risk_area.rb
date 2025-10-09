# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module RiskAssessment
        module Attributes
          class KeyRiskArea < Eccairs::Base::EnumEntity
            attribute_id 1097
            xml_tag "Key_Risk_Area"
            sequence 7
            allowed_values (1..36).to_a
          end
        end
      end
    end
  end
end
