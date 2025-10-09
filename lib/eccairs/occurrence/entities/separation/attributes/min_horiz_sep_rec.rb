# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Separation
        module Attributes
          class MinHorizSepRec < Eccairs::Base::Entity
            attribute_id 579
            xml_tag "Min_Horiz_Sep_Rec"
            sequence 4
            unit "NM"

            validates_numericality min: -999999, max: 999999, type: :decimal
          end
        end
      end
    end
  end
end
