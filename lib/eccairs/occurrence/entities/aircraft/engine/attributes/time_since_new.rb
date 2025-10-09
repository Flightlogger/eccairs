# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Engine
          module Attributes
            class TimeSinceNew < Eccairs::BaseEntity
              attribute_id 883
              xml_tag "Time_Since_New"
              sequence 6

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

