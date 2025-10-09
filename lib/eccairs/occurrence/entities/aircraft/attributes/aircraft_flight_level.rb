# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class AircraftFlightLevel < Eccairs::BaseEntity
            attribute_id 25
            xml_tag "A_C_Flight_Level"
            sequence 2
            # Type 3 is an integer
          end
        end
      end
    end
  end
end

