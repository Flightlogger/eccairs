# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AerodromeGeneral
        module Entities
          module Vehicle
            extend Eccairs::Base::EntityModule

            entity_id "48"
            xml_tag "Vehicle"
            requires_id
          end
        end
      end
    end
  end
end
