# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module GroundHandling
        module Attributes
          class GhTypeOfService < Eccairs::BaseEntity
            attribute_id 1115
            xml_tag "GH_Type_Of_Service"
            sequence 0
            validates_inclusion within: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
          end
        end
      end
    end
  end
end
