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
                  class DateOfLicense < Eccairs::Base::Entity
                    attribute_id 639
                    xml_tag "Date_Of_License"
                    sequence 4
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
