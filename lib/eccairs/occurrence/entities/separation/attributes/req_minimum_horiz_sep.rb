# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Separation
        module Attributes
          class ReqMinimumHorizSep < Eccairs::Base::Entity
            attribute_id 577
            xml_tag "Req_Minimum_Horiz_Sep"
            sequence 3
            unit "NM"

            validates_numericality min: -999999, max: 999999, type: :decimal
          end
        end
      end
    end
  end
end
