# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Entities
          module Propeller
            module Attributes
              class HazardousPropEffects < Eccairs::Base::Entity
                attribute_id 946
                xml_tag "Hazardous_Prop_Effects"
                sequence 15
                validates_inclusion within: [1, 2, 3, 4, 6, 5]
              end
            end
          end
        end
      end
    end
  end
end
