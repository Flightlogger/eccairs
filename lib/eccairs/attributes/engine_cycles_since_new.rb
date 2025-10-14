# frozen_string_literal: true

module Eccairs
  module Attributes
    class EngineCyclesSinceNew < Eccairs::Base::IntegerAttribute
      attribute_id 885
      xml_tag "Cycles_Since_New"
      sequence 9
      min 0
      max 999999
    end
  end
end
