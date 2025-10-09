# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Entities
          module Propeller
            module Attributes
              class CyclesSinceInsp < Eccairs::Base::IntegerEntity
                attribute_id 904
                xml_tag "Cycles_Since_Insp"
                sequence 11

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
