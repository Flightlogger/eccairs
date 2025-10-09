# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Entities
          module Engine
            module Attributes
              class EnginePosition < Eccairs::Base::Entity
                attribute_id 653
                xml_tag "Engine_Position"
                sequence 2
                validates_numericality min: 0, max: 999999, type: :integer
              end
            end
          end
        end
      end
    end
  end
end
