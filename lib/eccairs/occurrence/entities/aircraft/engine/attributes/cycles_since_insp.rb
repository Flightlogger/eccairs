# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Engine
          module Attributes
            class CyclesSinceInsp < Eccairs::BaseEntity
              attribute_id 887
              xml_tag "Cycles_Since_Insp"
              sequence 10
              validates_numericality min: 0, max: 999999, type: :integer
            end
          end
        end
      end
    end
  end
end
