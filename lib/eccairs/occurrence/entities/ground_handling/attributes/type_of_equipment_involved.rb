# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module GroundHandling
        module Attributes
          class TypeOfEquipmentInvolved < Eccairs::BaseEntity
            attribute_id 1120
            xml_tag "Type_Of_Equipment_Involved"
            sequence 4
            validates_inclusion within: (1..28).to_a
          end
        end
      end
    end
  end
end
