# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Entities
          module Engine
            module Attributes
              class EnginePosition < Eccairs::Base::IntegerEntity
                attribute_id 653
                xml_tag "Engine_Position"
                sequence 2

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
