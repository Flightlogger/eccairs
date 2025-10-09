# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module FlightCrewMember
          module Attributes
            class DutyLast24Hours < Eccairs::BaseEntity
              attribute_id 403
              xml_tag "Duty_Last_24_Hours"
              sequence 1

              protected

              def additional_xml_attributes
                { Unit: "Hour(s)" }
              end
            end
          end
        end
      end
    end
  end
end

