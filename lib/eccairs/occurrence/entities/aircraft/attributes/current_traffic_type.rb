# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class CurrentTrafficType < Eccairs::Base::EnumEntity
            attribute_id 29
            xml_tag "Current_Traffic_Type"
            sequence 3
            allowed_values [2, 1, 99]
            # Type 5 enum - VL29_5_0_1_1
          end
        end
      end
    end
  end
end
