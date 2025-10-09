# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Entities
          module FlightCrewMember
            module Entities
              module FlightCrewLicenses
                extend Eccairs::Base::EntityModule

                entity_id "16"
                xml_tag "Flight_Crew_Licenses"
              end
            end
          end
        end
      end
    end
  end
end
