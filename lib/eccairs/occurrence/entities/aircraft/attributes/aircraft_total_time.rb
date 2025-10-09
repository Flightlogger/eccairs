# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class AircraftTotalTime < Eccairs::Base::Entity
            attribute_id 291
            xml_tag "Aircraft_Total_Time"
            sequence 39
            unit "Hour(s)"

            validates_numericality min: -999999, max: 999999, type: :decimal
          end
        end
      end
    end
  end
end
