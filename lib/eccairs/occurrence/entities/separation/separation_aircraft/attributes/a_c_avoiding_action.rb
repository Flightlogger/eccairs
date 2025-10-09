# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Separation
        module SeparationAircraft
          module Attributes
            class ACAvoidingAction < Eccairs::BaseEntity
              attribute_id 566
              xml_tag "A_C_Avoiding_Action"
              sequence 1
              validates_inclusion within: [1, 4, 3, 2, 97, 99]
            end
          end
        end
      end
    end
  end
end
