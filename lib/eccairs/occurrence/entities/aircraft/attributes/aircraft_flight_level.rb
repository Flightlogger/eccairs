# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class AircraftFlightLevel < Eccairs::Base::Entity
            attribute_id 25
            xml_tag "A_C_Flight_Level"
            sequence 2
            validates_numericality min: 0, max: 999999, type: :integer
            # Type 3 is an integer
          end
        end
      end
    end
  end
end
