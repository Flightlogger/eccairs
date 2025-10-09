# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Entities
          module FlightCrewMember
            module Attributes
              class Category < Eccairs::Base::EnumEntity
                attribute_id 402
                xml_tag "Category"
                sequence 0
                allowed_values [4, 1, 3, 2, 98, 99]
              end
            end
          end
        end
      end
    end
  end
end
