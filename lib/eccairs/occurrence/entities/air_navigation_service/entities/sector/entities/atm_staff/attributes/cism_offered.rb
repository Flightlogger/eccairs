# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AirNavigationService
        module Entities
          module Sector
            module Entities
              module AtmStaff
                module Attributes
                  class CismOffered < Eccairs::Base::EnumEntity
                    attribute_id 340
                    xml_tag "CISM_Offered"
                    sequence 0
                    allowed_values [1, 2, 99, 100]
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
