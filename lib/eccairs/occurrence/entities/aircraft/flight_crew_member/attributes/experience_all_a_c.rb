# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module FlightCrewMember
          module Attributes
            class ExperienceAllAC < Eccairs::BaseEntity
              attribute_id 410
              xml_tag "Experience_All_A_C"
              sequence 3
              validates_numericality min: -999999, max: 999999, type: :decimal

              protected

              def additional_xml_attributes
                {Unit: "Hour(s)"}
              end
            end
          end
        end
      end
    end
  end
end
