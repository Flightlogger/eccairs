# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Entities
          module Engine
            module Attributes
              class TimeSinceOverhaul < Eccairs::Base::DecimalEntity
                attribute_id 389
                xml_tag "Time_Since_Overhaul"
                sequence 1
                unit "Hour(s)"

                min -999999


                max 999999
              end
            end
          end
        end
      end
    end
  end
end
