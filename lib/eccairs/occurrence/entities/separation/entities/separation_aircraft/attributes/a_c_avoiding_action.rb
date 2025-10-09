# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Separation
        module Entities
          module SeparationAircraft
            module Attributes
              class ACAvoidingAction < Eccairs::Base::EnumEntity
                attribute_id 566
                xml_tag "A_C_Avoiding_Action"
                sequence 1
                allowed_values [1, 4, 3, 2, 97, 99]
              end
            end
          end
        end
      end
    end
  end
end
