# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class FiledFlightRules < Eccairs::Base::EnumEntity
            attribute_id 117
            xml_tag "Filed_Flight_Rules"
            sequence 14
            allowed_values [1, 2, 5, 6, 4, 3, 7, 97, 98, 99]
          end
        end
      end
    end
  end
end
