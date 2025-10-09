# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AerodromeGeneral
        module Attributes
          class LandingAreaType < Eccairs::BaseEntity
            attribute_id 9
            xml_tag "Landing_Area_Type"
            sequence 7
            validates_inclusion within: [1, 2, 3, 4, 5, 6, 7, 99]
          end
        end
      end
    end
  end
end

