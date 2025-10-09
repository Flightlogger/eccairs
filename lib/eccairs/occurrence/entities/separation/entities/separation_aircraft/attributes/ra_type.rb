# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Separation
        module Entities
          module SeparationAircraft
            module Attributes
              class RaType < Eccairs::BaseEntity
                attribute_id 610
                xml_tag "RA_Type"
                sequence 6
                validates_inclusion within: [1, 2, 3, 4, 5, 6, 7, 8, 9]
              end
            end
          end
        end
      end
    end
  end
end
