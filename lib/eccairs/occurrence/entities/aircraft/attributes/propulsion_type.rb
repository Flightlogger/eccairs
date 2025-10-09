# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class PropulsionType < Eccairs::BaseEntity
            attribute_id 232
            xml_tag "Propulsion_Type"
            sequence 29
            validates_inclusion within: [100, 1, 2, 5, 4, 3, 97, 98, 101, 99]
          end
        end
      end
    end
  end
end
