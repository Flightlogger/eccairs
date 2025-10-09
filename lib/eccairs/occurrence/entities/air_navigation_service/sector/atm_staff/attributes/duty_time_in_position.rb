# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AirNavigationService
        module Sector
          module AtmStaff
            module Attributes
              class DutyTimeInPosition < Eccairs::BaseEntity
                attribute_id 347
                xml_tag "Duty_Time_In_Position"
                sequence 1

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
end
