# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Entities
          module Propeller
            module Attributes
              class PropInvolvement < Eccairs::Base::Entity
                attribute_id 896
                xml_tag "Prop_Involvement"
                sequence 5
                validates_inclusion within: [3, 4, 7, 6, 5, 8, 2, 1]
              end
            end
          end
        end
      end
    end
  end
end
