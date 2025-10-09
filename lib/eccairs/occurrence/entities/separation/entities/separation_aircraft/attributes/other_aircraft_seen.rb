# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Separation
        module Entities
          module SeparationAircraft
            module Attributes
              class OtherAircraftSeen < Eccairs::Base::EnumEntity
                attribute_id 587
                xml_tag "Other_Aircraft_Seen"
                sequence 2
                allowed_values [1, 3, 2, 99]
              end
            end
          end
        end
      end
    end
  end
end
