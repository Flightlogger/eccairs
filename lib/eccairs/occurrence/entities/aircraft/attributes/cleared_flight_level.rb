# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class ClearedFlightLevel < Eccairs::Base::IntegerEntity
            attribute_id 60
            xml_tag "Cleared_Flight_Level"
            sequence 10

            min 0


            max 999999
          end
        end
      end
    end
  end
end
