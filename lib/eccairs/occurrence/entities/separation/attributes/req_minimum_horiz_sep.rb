# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Separation
        module Attributes
          class ReqMinimumHorizSep < Eccairs::BaseEntity
            attribute_id 577
            xml_tag "Req_Minimum_Horiz_Sep"
            sequence 3
            validates_numericality min: -999999, max: 999999, type: :decimal

            def additional_xml_attributes
              { Unit: "NM" }
            end
          end
        end
      end
    end
  end
end
