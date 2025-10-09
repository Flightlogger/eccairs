# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Entities
          module PartInformation
            module Attributes
              class LifeControlledPart < Eccairs::Base::EnumEntity
                attribute_id 1114
                xml_tag "Life_Controlled_Part"
                sequence 14
                allowed_values [1, 2, 99]
              end
            end
          end
        end
      end
    end
  end
end
