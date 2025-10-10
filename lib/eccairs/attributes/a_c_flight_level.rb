# frozen_string_literal: true

module Eccairs
  module Attributes
    class ACFlightLevel < Eccairs::Base::IntegerAttribute
      attribute_id "25"
      xml_tag "A_C_Flight_Level"
      sequence 2
      min 0
      max 999999
    end
  end
end
