# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AirSpace
        module Attributes
          class AirspaceClass < Eccairs::BaseEntity
            attribute_id 13
            xml_tag "Airspace_Class"
            sequence 0

            validates_inclusion within: [1, 2, 3, 4, 5, 6, 7, 98, 99, 100]
          end
        end
      end
    end
  end
end

