# frozen_string_literal: true

module Eccairs
  module Attributes
    class TotalSeriousInjuriesGround < Eccairs::Base::IntegerAttribute
      attribute_id "472"
      xml_tag "Total_Serious_Injuries-Ground"
      sequence 34
      min 0
      max 100000
    end
  end
end
