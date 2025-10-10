# frozen_string_literal: true

module Eccairs
  module Attributes
    class CyclesSinceNew < Eccairs::Base::IntegerAttribute
      attribute_id 902
      xml_tag "Cycles_Since_New"
      sequence 9
      min 0
      max 999999
    end
  end
end
