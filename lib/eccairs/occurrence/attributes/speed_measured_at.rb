# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class SpeedMeasuredAt < Eccairs::BaseEntity
        attribute_id 275
        xml_tag "Speed_Measured_At"
        sequence 7
        validates_inclusion within: {
          NO: 2,
          YES: 1,
          UNKNOWN: 99
        }
      end
    end
  end
end
