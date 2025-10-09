# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Propeller
          module Attributes
            class MakeOfPropeller < Eccairs::BaseEntity
              attribute_id 492
              xml_tag "Make_Of_Propeller"
              sequence 0
              validates_inclusion within: [100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 23, 25, 26, 98, 99]
            end
          end
        end
      end
    end
  end
end
