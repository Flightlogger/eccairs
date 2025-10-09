# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module DangerousGoods
        module Attributes
          class NumberOfInnerPackages < Eccairs::Base::IntegerEntity
            attribute_id 1058
            xml_tag "Number_Of_Inner_Packages"
            sequence 8

            min 0

            max 999999
          end
        end
      end
    end
  end
end
