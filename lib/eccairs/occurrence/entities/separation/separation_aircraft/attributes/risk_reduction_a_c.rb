# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Separation
        module SeparationAircraft
          module Attributes
            class RiskReductionAC < Eccairs::BaseEntity
              attribute_id 591
              xml_tag "Risk_Reduction_A_C"
              sequence 3
              validates_inclusion within: [1, 2, 99]
            end
          end
        end
      end
    end
  end
end
