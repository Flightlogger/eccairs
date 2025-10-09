# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Entities
          module Engine
            module Attributes
              class CyclesSinceNew < Eccairs::Base::Entity
                attribute_id 885
                xml_tag "Cycles_Since_New"
                sequence 8
                validates_numericality min: 0, max: 999999, type: :integer
              end
            end
          end
        end
      end
    end
  end
end
