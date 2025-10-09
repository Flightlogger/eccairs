# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AirSpace
        module Attributes
          class AirspaceType < Eccairs::Base::Entity
            attribute_id 15
            xml_tag "Airspace_Type"
            sequence 2

            validates_inclusion within: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 98, 99, 100, 101, 102, 103, 104, 107, 108, 109, 110, 111]
          end
        end
      end
    end
  end
end
