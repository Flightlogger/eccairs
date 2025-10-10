# frozen_string_literal: true

module Eccairs
  module Attributes
    class CyclesSinceOverh < Eccairs::Base::IntegerAttribute
      attribute_id 903
      xml_tag "Cycles_Since_Overh"
      sequence 10
      min 0
      max 999999
    end
  end
end
