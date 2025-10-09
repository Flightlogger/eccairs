# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module PartInformation
          module Attributes
            class TimeSinceNew < Eccairs::BaseEntity
              attribute_id 660
              xml_tag "Time_Since_New"
              sequence 5

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

