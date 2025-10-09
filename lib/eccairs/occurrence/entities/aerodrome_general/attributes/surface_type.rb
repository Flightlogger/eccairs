# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AerodromeGeneral
        module Attributes
          class SurfaceType < Eccairs::Base::Entity
            attribute_id 8
            xml_tag "Surface_Type"
            sequence 6
            validates_inclusion within: [1, 2, 3, 4, 5, 6, 98, 99]
          end
        end
      end
    end
  end
end
