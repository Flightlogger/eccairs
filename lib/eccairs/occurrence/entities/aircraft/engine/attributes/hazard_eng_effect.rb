# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Engine
          module Attributes
            class HazardEngEffect < Eccairs::BaseEntity
              attribute_id 945
              xml_tag "Hazard_Eng_Effect"
              sequence 14
              validates_inclusion within: [1, 2, 3, 4, 9, 6, 10, 8, 7]
            end
          end
        end
      end
    end
  end
end
