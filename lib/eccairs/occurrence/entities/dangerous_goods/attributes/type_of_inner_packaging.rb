# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module DangerousGoods
        module Attributes
          class TypeOfInnerPackaging < Eccairs::Base::EnumEntity
            attribute_id 1059
            xml_tag "Type_Of_Inner_Packaging"
            sequence 9
            allowed_values [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
          end
        end
      end
    end
  end
end
