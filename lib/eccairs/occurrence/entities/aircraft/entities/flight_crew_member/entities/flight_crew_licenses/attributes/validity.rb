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
                  class Validity < Eccairs::Base::EnumEntity
                    attribute_id 397
                    xml_tag "Validity"
                    sequence 0
                    allowed_values [1, 2, 97, 99]
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
