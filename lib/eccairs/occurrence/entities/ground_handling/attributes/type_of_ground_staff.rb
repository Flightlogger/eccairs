# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module GroundHandling
        module Attributes
          class TypeOfGroundStaff < Eccairs::Base::Entity
            attribute_id 1117
            xml_tag "Type_of_Ground_staff"
            sequence 2
            validates_inclusion within: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]
          end
        end
      end
    end
  end
end
