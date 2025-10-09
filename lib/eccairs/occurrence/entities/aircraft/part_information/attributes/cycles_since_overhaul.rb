# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module PartInformation
          module Attributes
            class CyclesSinceOverhaul < Eccairs::BaseEntity
              attribute_id 664
              xml_tag "Cycles_Since_Overhaul"
              sequence 9
              validates_numericality min: 0, max: 999999, type: :integer
            end
          end
        end
      end
    end
  end
end
