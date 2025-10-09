# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AerodromeGeneral
        module Entities
          module Vehicle
            module Attributes
              class VehicleControlled < Eccairs::Base::EnumEntity
                attribute_id 743
                xml_tag "Vehicle_Controlled"
                sequence 1

                allowed_values(
                  YES: 1,
                  NO: 2,
                  UNKNOWN: 99
        )
              end
            end
          end
        end
      end
    end
  end
end
