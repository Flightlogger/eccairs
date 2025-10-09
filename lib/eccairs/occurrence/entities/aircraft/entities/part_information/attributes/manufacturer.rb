# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Entities
          module PartInformation
            module Attributes
              class Manufacturer < Eccairs::Base::EnumEntity
                attribute_id 658
                xml_tag "Manufacturer"
                sequence 3
                allowed_values (1..224).to_a
              end
            end
          end
        end
      end
    end
  end
end
