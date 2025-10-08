# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AerodromeGeneral
        module Attributes
          class LocationIndicator < Eccairs::BaseEntity
            attribute_id 5
            xml_tag "Location_Indicator"
            sequence 2
            parent_entity_id 1
          end
        end
      end
    end
  end
end
