# frozen_string_literal: true

module Eccairs
  module Attributes
    class EngineCyclesSinceOverhaul < Eccairs::Base::IntegerAttribute
      attribute_id 886
      xml_tag "Cycles_Since_Overhaul"
      sequence 10
      min 0
      max 999999
    end
  end
end
