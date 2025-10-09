# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Entities
          module FlightCrewMember
            module Attributes
              class ExperienceThisAC < Eccairs::Base::Entity
                attribute_id 411
                xml_tag "Experience_This_A_C"
                sequence 4
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
