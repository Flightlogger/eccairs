# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AerodromeGeneral
        module Runway
          extend Eccairs::BaseEntityModule

          entity_id "31"
          xml_tag "Runway"
          requires_id
        end
      end
    end
  end
end
