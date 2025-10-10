# frozen_string_literal: true

module Eccairs
  module Attributes
    class QuantityPerInnerPackaging < Eccairs::Base::IntegerAttribute
      attribute_id 1060
      xml_tag "Quantity_Per_Inner_Packaging"
      sequence 10
      min 0
      max 999999
    end
  end
end
