# frozen_string_literal: true

module Eccairs
  module Attributes
    class RateOfClosure < Eccairs::Base::DecimalAttribute
      attribute_id 588
      xml_tag "Rate_Of_Closure"
      sequence 8
      unit "kt"
      min(-999999)
      max 999999
    end
  end
end
