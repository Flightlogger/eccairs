# frozen_string_literal: true

module Eccairs
  module Attributes
    class CyclesSinceOverhaul < Eccairs::Base::IntegerAttribute
      attribute_id 664
      xml_tag "Cycles_Since_Overhaul"
      sequence 9
      min 0
      max 999999
    end
  end
end
