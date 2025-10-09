# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Entities
          module Propeller
            module Attributes
              class CyclesSinceOverh < Eccairs::Base::IntegerEntity
                attribute_id 903
                xml_tag "Cycles_Since_Overh"
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
