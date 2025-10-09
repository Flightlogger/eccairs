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
                  class Ratings < Eccairs::BaseEntity
                    attribute_id 398
                    xml_tag "Ratings"
                    sequence 1
                    validates_inclusion within: [1, 2, 3, 99]
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
