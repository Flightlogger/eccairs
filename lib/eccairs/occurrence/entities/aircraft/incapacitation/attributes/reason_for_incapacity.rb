# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Incapacitation
          module Attributes
            class ReasonForIncapacity < Eccairs::BaseEntity
              attribute_id 419
              xml_tag "Reason_For_Incapacity"
              sequence 1
              validates_inclusion within: [4, 6, 7, 3, 10, 9, 8, 1, 2, 5, 97, 98, 99]
            end
          end
        end
      end
    end
  end
end
