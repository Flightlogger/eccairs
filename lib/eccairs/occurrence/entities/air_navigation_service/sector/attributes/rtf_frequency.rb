# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AirNavigationService
        module Sector
          module Attributes
            class RtfFrequency < Eccairs::BaseEntity
              attribute_id 619
              xml_tag "RTF_Frequency"
              sequence 3

              def additional_xml_attributes
                { Unit: "kHz" }
              end
            end
          end
        end
      end
    end
  end
end
