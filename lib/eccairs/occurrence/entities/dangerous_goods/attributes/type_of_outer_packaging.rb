# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module DangerousGoods
        module Attributes
          class TypeOfOuterPackaging < Eccairs::Base::Entity
            attribute_id 1056
            xml_tag "Type_Of_Outer_Packaging"
            sequence 6
            validates_inclusion within: (1..53).to_a
          end
        end
      end
    end
  end
end
