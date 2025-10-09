# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class TotalFatalitiesGround < Eccairs::Base::IntegerEntity
        attribute_id 460
        xml_tag "Total_Fatalities_Ground"
        sequence 30

        min 0


        max 100000
      end
    end
  end
end
