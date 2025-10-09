# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Entities
          module Propeller
            module Attributes
              class TimeSinceInspection < Eccairs::Base::Entity
                attribute_id 901
                xml_tag "Time_Since_Inspection"
                sequence 8
                unit "Hour(s)"

                validates_numericality min: -999999, max: 999999, type: :decimal
              end
            end
          end
        end
      end
    end
  end
end
