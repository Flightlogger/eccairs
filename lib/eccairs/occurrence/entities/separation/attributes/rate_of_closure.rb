# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Separation
        module Attributes
          class RateOfClosure < Eccairs::Base::Entity
            attribute_id 588
            xml_tag "Rate_Of_Closure"
            sequence 8
            validates_numericality min: -999999, max: 999999, type: :decimal

            def additional_xml_attributes
              {Unit: "kt"}
            end
          end
        end
      end
    end
  end
end
