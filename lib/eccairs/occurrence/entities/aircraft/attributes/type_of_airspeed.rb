# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class TypeOfAirspeed < Eccairs::Base::EnumEntity
            attribute_id 276
            xml_tag "Type_Of_Airspeed"
            sequence 36
            allowed_values [100, 2, 1, 101, 97, 99]
          end
        end
      end
    end
  end
end
