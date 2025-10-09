# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class FlightNumber < Eccairs::BaseEntity
            attribute_id 120
            xml_tag "Flight_Number"
            sequence 16
          end
        end
      end
    end
  end
end

