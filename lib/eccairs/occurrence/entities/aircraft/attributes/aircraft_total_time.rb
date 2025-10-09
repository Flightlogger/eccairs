# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class AircraftTotalTime < Eccairs::Base::DecimalEntity
            attribute_id 291
            xml_tag "Aircraft_Total_Time"
            sequence 39
            unit "Hour(s)"

            min(-999999)

            max 999999
          end
        end
      end
    end
  end
end
