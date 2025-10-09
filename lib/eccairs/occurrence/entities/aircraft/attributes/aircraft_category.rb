# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class AircraftCategory < Eccairs::Base::Entity
            attribute_id 32
            xml_tag "Aircraft_Category"
            sequence 4
            validates_inclusion within: [1, 8, 11, 16, 14, 15, 27, 74, 12, 17, 73, 13, 18, 19, 9, 20, 75, 71, 21, 23, 24, 70, 22, 25, 26, 2, 29, 31, 35, 34, 36, 67, 32, 76, 72, 33, 30, 37, 38, 3, 39, 42, 43, 44, 68, 40, 45, 47, 48, 46, 69, 41, 5, 60, 6, 61, 62, 63, 64, 4, 49, 56, 57, 50, 58, 59, 51, 28, 52, 53, 55, 54, 65, 7]
            # Type 5 enum - VL1179_5_0_1_4
          end
        end
      end
    end
  end
end
