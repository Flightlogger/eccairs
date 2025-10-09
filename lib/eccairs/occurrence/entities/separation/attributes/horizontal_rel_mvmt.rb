# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Separation
        module Attributes
          class HorizontalRelMvmt < Eccairs::Base::Entity
            attribute_id 570
            xml_tag "Horizontal_Rel_Mvmt"
            sequence 0
            validates_inclusion within: [3, 1, 2, 4, 5, 6, 99]
          end
        end
      end
    end
  end
end
