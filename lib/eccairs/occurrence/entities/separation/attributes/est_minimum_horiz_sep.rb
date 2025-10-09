# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Separation
        module Attributes
          class EstMinimumHorizSep < Eccairs::BaseEntity
            attribute_id 575
            xml_tag "Est_Minimum_Horiz_Sep"
            sequence 2

            def additional_xml_attributes
              { Unit: "NM" }
            end
          end
        end
      end
    end
  end
end
