# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class MaximumToMass < Eccairs::BaseEntity
            attribute_id 175
            xml_tag "Maximum_T_O_Mass"
            sequence 22

            protected

            def additional_xml_attributes
              { Unit: "kg" }
            end
          end
        end
      end
    end
  end
end
