# frozen_string_literal: true

module Eccairs
  module Attributes
    class TotalMinorInjuriesGround < Eccairs::Base::IntegerAttribute
      attribute_id "469"
      xml_tag "Total_Minor_Injuries-Ground"
      sequence 33
      min 0
      max 100000
    end
  end
end
