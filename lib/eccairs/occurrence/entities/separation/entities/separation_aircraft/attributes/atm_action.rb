# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Separation
        module Entities
          module SeparationAircraft
            module Attributes
              class AtmAction < Eccairs::Base::EnumEntity
                attribute_id 565
                xml_tag "ATM_Action"
                sequence 0
                allowed_values [1, 4, 3, 2, 97, 99]
              end
            end
          end
        end
      end
    end
  end
end
