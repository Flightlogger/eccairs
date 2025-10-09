# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Entities
          module Engine
            module Attributes
              class CyclesSinceInsp < Eccairs::Base::IntegerEntity
                attribute_id 887
                xml_tag "Cycles_Since_Insp"
                sequence 10

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
