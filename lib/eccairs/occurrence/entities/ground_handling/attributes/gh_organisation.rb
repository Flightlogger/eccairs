# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module GroundHandling
        module Attributes
          class GhOrganisation < Eccairs::BaseEntity
            attribute_id 1116
            xml_tag "GH_Organisation"
            sequence 1
            validates_inclusion within: (1..35).to_a
          end
        end
      end
    end
  end
end
