# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class LandingGearType < Eccairs::Base::EnumEntity
            attribute_id 166
            xml_tag "Landing_Gear_Type"
            sequence 20
            allowed_values [100, 6, 5, 101, 8, 9, 102, 10, 11, 7, 3, 1, 4, 12, 13, 98, 99]
          end
        end
      end
    end
  end
end
