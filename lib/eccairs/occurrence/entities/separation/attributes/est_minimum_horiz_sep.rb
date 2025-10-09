# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Separation
        module Attributes
          class EstMinimumHorizSep < Eccairs::Base::DecimalEntity
            attribute_id 575
            xml_tag "Est_Minimum_Horiz_Sep"
            sequence 2
            unit "NM"

            min(-999999)

            max 999999
          end
        end
      end
    end
  end
end
