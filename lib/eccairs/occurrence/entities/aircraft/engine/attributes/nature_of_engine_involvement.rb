# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Engine
          module Attributes
            class NatureOfEngineInvolvement < Eccairs::BaseEntity
              attribute_id 654
              xml_tag "Nature_Of_Engine_Involvement"
              sequence 3
              validates_inclusion within: [3, 4, 7, 6, 5, 8, 2, 1]
            end
          end
        end
      end
    end
  end
end
