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
                  class Validity < Eccairs::BaseEntity
                    attribute_id 397
                    xml_tag "Validity"
                    sequence 0
                    validates_inclusion within: [1, 2, 97, 99]
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
