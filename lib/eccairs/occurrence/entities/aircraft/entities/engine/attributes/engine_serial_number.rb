# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Entities
          module Engine
            module Attributes
              class EngineSerialNumber < Eccairs::Base::Entity
                attribute_id 881
                xml_tag "Engine_Serial_Number"
                sequence 4
              end
            end
          end
        end
      end
    end
  end
end
