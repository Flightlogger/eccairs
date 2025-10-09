# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class MaximumToMass < Eccairs::Base::DecimalEntity
            attribute_id 175
            xml_tag "Maximum_T_O_Mass"
            sequence 22
            unit "kg"

            min(-999999)

            max 999999
          end
        end
      end
    end
  end
end
