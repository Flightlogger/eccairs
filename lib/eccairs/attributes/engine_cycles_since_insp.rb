# frozen_string_literal: true

module Eccairs
  module Attributes
    class EngineCyclesSinceInsp < Eccairs::Base::IntegerAttribute
      attribute_id 887
      xml_tag "Cycles_Since_Insp"
      sequence 11
      min 0
      max 999999
    end
  end
end
