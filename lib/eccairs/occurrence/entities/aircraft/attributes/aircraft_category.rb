# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class AircraftCategory < Eccairs::BaseEntity
            attribute_id 32
            xml_tag "Aircraft_Category"
            sequence 4
            # Type 5 enum - VL1179_5_0_1_4
          end
        end
      end
    end
  end
end

