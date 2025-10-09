# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Entities
          module FlightCrewMember
            module Entities
              module FlightCrewLicenses
                module Attributes
                  class LicenseIssuedBy < Eccairs::Base::EnumEntity
                    attribute_id 399
                    xml_tag "License_Issued_By"
                    sequence 2
                    allowed_values [1, 2, 100, 99]
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
