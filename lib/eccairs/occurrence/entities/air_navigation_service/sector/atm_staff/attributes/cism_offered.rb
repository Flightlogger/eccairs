# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AirNavigationService
        module Sector
          module AtmStaff
            module Attributes
              class CismOffered < Eccairs::BaseEntity
                attribute_id 340
                xml_tag "CISM_Offered"
                sequence 0
                validates_inclusion within: [1, 2, 99, 100]
              end
            end
          end
        end
      end
    end
  end
end
