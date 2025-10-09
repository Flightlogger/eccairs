# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class FlightPhase < Eccairs::Base::Entity
            attribute_id 121
            xml_tag "Flight_Phase"
            sequence 17
            validates_inclusion within: [1, 2, 3, 4, 6, 7, 5, 8, 100, 101, 99]
          end
        end
      end
    end
  end
end
