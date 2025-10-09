# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class OperationType < Eccairs::BaseEntity
            attribute_id 214
            xml_tag "Operation_Type"
            sequence 26
            validates_inclusion within: [1, 2, 5, 6, 7, 8, 9, 10, 11, 3, 12, 13, 14, 15, 16, 4, 17, 18, 19, 20, 21, 22, 23, 71, 72, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 35, 41, 42, 43, 44, 36, 45, 46, 47, 48, 49, 50, 51, 37, 52, 53, 54, 55, 38, 56, 57, 58, 39, 40, 59, 62, 63, 64, 65, 66, 67, 68, 69, 70, 60, 73, 61]
          end
        end
      end
    end
  end
end
