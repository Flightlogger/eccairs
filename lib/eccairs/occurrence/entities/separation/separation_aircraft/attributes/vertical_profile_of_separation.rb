# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Separation
        module SeparationAircraft
          module Attributes
            class VerticalProfileOfSeparation < Eccairs::BaseEntity
              attribute_id 598
              xml_tag "Vertical_Profile_Of_Separation"
              sequence 5
              validates_inclusion within: [1, 2, 3, 99]
            end
          end
        end
      end
    end
  end
end
