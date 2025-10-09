# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Separation
        module Attributes
          class VerticalSepRecorded < Eccairs::Base::Entity
            attribute_id 585
            xml_tag "Vertical_Sep_Recorded"
            sequence 7
            unit "ft"

            validates_numericality min: -999999, max: 999999, type: :decimal
          end
        end
      end
    end
  end
end
