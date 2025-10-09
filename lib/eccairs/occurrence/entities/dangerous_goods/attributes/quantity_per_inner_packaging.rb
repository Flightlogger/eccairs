# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module DangerousGoods
        module Attributes
          class QuantityPerInnerPackaging < Eccairs::Base::IntegerEntity
            attribute_id 1060
            xml_tag "Quantity_Per_Inner_Packaging"
            sequence 10

            min 0

            max 999999
          end
        end
      end
    end
  end
end
