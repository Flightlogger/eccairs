# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Entities
          module Incapacitation
            module Attributes
              class PersonIncapacitated < Eccairs::Base::EnumEntity
                attribute_id 418
                xml_tag "Person_Incapacitated"
                sequence 0
                allowed_values [1, 2, 3, 97, 98, 99]
              end
            end
          end
        end
      end
    end
  end
end
