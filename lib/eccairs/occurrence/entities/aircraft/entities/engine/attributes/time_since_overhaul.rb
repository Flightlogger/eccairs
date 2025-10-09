# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Entities
          module Engine
            module Attributes
              class TimeSinceOverhaul < Eccairs::Base::Entity
                attribute_id 389
                xml_tag "Time_Since_Overhaul"
                sequence 1
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
