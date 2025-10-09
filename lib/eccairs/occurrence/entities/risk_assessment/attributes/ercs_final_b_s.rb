# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module RiskAssessment
        module Attributes
          class ErcsFinalBS < Eccairs::Base::Entity
            attribute_id 1107
            xml_tag "ERCS_Final_B_S"
            sequence 17
            validates_numericality min: 0, max: 999999, type: :integer
          end
        end
      end
    end
  end
end
