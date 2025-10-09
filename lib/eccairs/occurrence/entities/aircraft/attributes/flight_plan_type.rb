# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class FlightPlanType < Eccairs::Base::Entity
            attribute_id 297
            xml_tag "Flight_Plan_Type"
            sequence 41
            validates_inclusion within: [4, 2, 1, 3, 5, 99]
          end
        end
      end
    end
  end
end
