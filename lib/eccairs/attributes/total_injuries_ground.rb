# frozen_string_literal: true

module Eccairs
  module Attributes
    class TotalInjuriesGround < Eccairs::Base::IntegerAttribute
      attribute_id "463"
      xml_tag "Total_Injuries-Ground"
      sequence 32
      min 0
      max 100000
    end
  end
end
