# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module DangerousGoods
        module Attributes
          class TypeOfOuterPackaging < Eccairs::Base::EnumEntity
            attribute_id 1056
            xml_tag "Type_Of_Outer_Packaging"
            sequence 6
            allowed_values (1..53).to_a
          end
        end
      end
    end
  end
end
