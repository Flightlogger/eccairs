# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module RiskAssessment
        module Attributes
          class TacticalPlanning < Eccairs::Base::Entity
            attribute_id 1099
            xml_tag "Tactical_Planning"
            sequence 9
            validates_inclusion within: [1, 2, 3, 4, 5, 6]
          end
        end
      end
    end
  end
end
