# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Separation
        module Attributes
          class VerticalSepRecorded < Eccairs::BaseEntity
            attribute_id 585
            xml_tag "Vertical_Sep_Recorded"
            sequence 7

            def additional_xml_attributes
              { Unit: "ft" }
            end
          end
        end
      end
    end
  end
end
