# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class MaximumToMass < Eccairs::Base::Entity
            attribute_id 175
            xml_tag "Maximum_T_O_Mass"
            sequence 22
            validates_numericality min: -999999, max: 999999, type: :decimal

            protected

            def additional_xml_attributes
              {Unit: "kg"}
            end
          end
        end
      end
    end
  end
end
