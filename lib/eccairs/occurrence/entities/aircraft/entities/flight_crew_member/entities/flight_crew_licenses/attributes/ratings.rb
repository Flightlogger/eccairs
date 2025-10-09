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
                  class Ratings < Eccairs::Base::EnumEntity
                    attribute_id 398
                    xml_tag "Ratings"
                    sequence 1
                    allowed_values [1, 2, 3, 99]
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
