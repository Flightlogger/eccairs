# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Separation
        module SeparationAircraft
          module Attributes
            class PilotResponseToRa < Eccairs::BaseEntity
              attribute_id 611
              xml_tag "Pilot_Response_To_RA"
              sequence 7
              validates_inclusion within: [1, 2, 3, 4, 5, 6]
            end
          end
        end
      end
    end
  end
end
