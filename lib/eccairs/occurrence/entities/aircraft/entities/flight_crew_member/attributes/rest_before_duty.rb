# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Entities
          module FlightCrewMember
            module Attributes
              class RestBeforeDuty < Eccairs::Base::Entity
                attribute_id 408
                xml_tag "Rest_Before_Duty"
                sequence 2
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
end
