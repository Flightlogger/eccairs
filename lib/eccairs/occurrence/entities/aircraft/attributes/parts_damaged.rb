# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class PartsDamaged < Eccairs::Base::Entity
            attribute_id 643
            xml_tag "Parts_Damaged"
            sequence 46
            validates_inclusion within: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 16, 15]
          end
        end
      end
    end
  end
end
