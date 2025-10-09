# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Propeller
          module Attributes
            class TimeSinceInspection < Eccairs::BaseEntity
              attribute_id 901
              xml_tag "Time_Since_Inspection"
              sequence 8
              validates_numericality min: -999999, max: 999999, type: :decimal

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
