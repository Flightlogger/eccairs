# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Separation
        module Attributes
          class EstMinimumHorizSep < Eccairs::Base::Entity
            attribute_id 575
            xml_tag "Est_Minimum_Horiz_Sep"
            sequence 2
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
