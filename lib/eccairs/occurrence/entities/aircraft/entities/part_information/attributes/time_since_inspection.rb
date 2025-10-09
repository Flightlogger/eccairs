# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Entities
          module PartInformation
            module Attributes
              class TimeSinceInspection < Eccairs::Base::Entity
                attribute_id 662
                xml_tag "Time_Since_Inspection"
                sequence 7
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
