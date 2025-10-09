# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AirNavigationService
        module Entities
          module Sector
            extend Eccairs::Base::EntityModule

            entity_id "33"
            xml_tag "Sector"
            requires_id
          end
        end
      end
    end
  end
end
