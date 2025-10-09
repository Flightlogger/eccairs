# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module FlightCrewMember
          module FlightCrewLicenses
            module Attributes
              class LicenseType < Eccairs::BaseEntity
                attribute_id 400
                xml_tag "License_Type"
                sequence 3
              end
            end
          end
        end
      end
    end
  end
end

