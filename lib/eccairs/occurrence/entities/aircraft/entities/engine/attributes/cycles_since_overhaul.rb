# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Entities
          module Engine
            module Attributes
              class CyclesSinceOverhaul < Eccairs::Base::IntegerEntity
                attribute_id 886
                xml_tag "Cycles_Since_Overhaul"
                sequence 9

                min 0

                max 999999
              end
            end
          end
        end
      end
    end
  end
end
