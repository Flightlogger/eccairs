# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Entities
          module PartInformation
            module Attributes
              class CyclesSinceNew < Eccairs::Base::IntegerEntity
                attribute_id 663
                xml_tag "Cycles_Since_New"
                sequence 8

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
