# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class CurrentFlightRules < Eccairs::Base::EnumEntity
            attribute_id 79
            xml_tag "Current_Flight_Rules"
            sequence 12
            allowed_values [1, 2, 4, 3, 7, 97, 98, 99]
          end
        end
      end
    end
  end
end
