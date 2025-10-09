# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Entities
          module Propeller
            module Attributes
              class PropPosition < Eccairs::Base::Entity
                attribute_id 895
                xml_tag "Prop_Position"
                sequence 4
                validates_numericality min: 0, max: 999999, type: :integer
              end
            end
          end
        end
      end
    end
  end
end
