# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Separation
        module Attributes
          class MinHorizSepRec < Eccairs::BaseEntity
            attribute_id 579
            xml_tag "Min_Horiz_Sep_Rec"
            sequence 4
            validates_numericality min: -999999, max: 999999, type: :decimal

            def additional_xml_attributes
              {Unit: "NM"}
            end
          end
        end
      end
    end
  end
end
