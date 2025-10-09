# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class CurrentTrafficType < Eccairs::Base::Entity
            attribute_id 29
            xml_tag "Current_Traffic_Type"
            sequence 3
            validates_inclusion within: [2, 1, 99]
            # Type 5 enum - VL29_5_0_1_1
          end
        end
      end
    end
  end
end
