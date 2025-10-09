# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class TypeOfAirspeed < Eccairs::Base::Entity
            attribute_id 276
            xml_tag "Type_Of_Airspeed"
            sequence 36
            validates_inclusion within: [100, 2, 1, 101, 97, 99]
          end
        end
      end
    end
  end
end
