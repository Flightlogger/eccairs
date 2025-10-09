# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module FlightCrewMember
          module Attributes
            class Category < Eccairs::BaseEntity
              attribute_id 402
              xml_tag "Category"
              sequence 0
              validates_inclusion within: [4, 1, 3, 2, 98, 99]
            end
          end
        end
      end
    end
  end
end
