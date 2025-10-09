# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module GroundHandling
        module Attributes
          class GhOrganisation < Eccairs::Base::EnumEntity
            attribute_id 1116
            xml_tag "GH_Organisation"
            sequence 1
            allowed_values (1..35).to_a
          end
        end
      end
    end
  end
end
