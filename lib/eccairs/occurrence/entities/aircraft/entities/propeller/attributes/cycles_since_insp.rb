# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Entities
          module Propeller
            module Attributes
              class CyclesSinceInsp < Eccairs::Base::Entity
                attribute_id 904
                xml_tag "Cycles_Since_Insp"
                sequence 11
                validates_numericality min: 0, max: 999999, type: :integer
              end
            end
          end
        end
      end
    end
  end
end
