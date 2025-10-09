# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module FlightCrewMember
          module Attributes
            class ExperienceThisAC < Eccairs::BaseEntity
              attribute_id 411
              xml_tag "Experience_This_A_C"
              sequence 4

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

