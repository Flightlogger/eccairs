# frozen_string_literal: true

module Eccairs
  module Attributes
    class TotalFatalitiesGround < Eccairs::Base::IntegerAttribute
      attribute_id 460
      xml_tag "Total_Fatalities_Ground"
      sequence 30
      min 0
      max 100000
    end
  end
end
