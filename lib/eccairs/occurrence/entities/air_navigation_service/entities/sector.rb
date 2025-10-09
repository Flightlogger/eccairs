# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AirNavigationService
        module Entities
          module Sector
            extend Eccairs::BaseEntityModule

            entity_id "33"
            xml_tag "Sector"
            requires_id
          end
        end
      end
    end
  end
end
