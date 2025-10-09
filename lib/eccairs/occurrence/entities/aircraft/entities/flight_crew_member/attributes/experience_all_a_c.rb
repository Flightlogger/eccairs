# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Entities
          module FlightCrewMember
            module Attributes
              class ExperienceAllAC < Eccairs::Base::DecimalEntity
                attribute_id 410
                xml_tag "Experience_All_A_C"
                sequence 3
                unit "Hour(s)"

                min(-999999)

                max 999999
              end
            end
          end
        end
      end
    end
  end
end
