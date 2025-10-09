# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Entities
          module FlightCrewMember
            module Attributes
              class DutyLast24Hours < Eccairs::Base::Entity
                attribute_id 403
                xml_tag "Duty_Last_24_Hours"
                sequence 1
                unit "Hour(s)"

                validates_numericality min: -999999, max: 999999, type: :decimal
              end
            end
          end
        end
      end
    end
  end
end
