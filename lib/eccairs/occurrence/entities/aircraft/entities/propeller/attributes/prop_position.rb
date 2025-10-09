# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Entities
          module Propeller
            module Attributes
              class PropPosition < Eccairs::Base::IntegerEntity
                attribute_id 895
                xml_tag "Prop_Position"
                sequence 4

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
