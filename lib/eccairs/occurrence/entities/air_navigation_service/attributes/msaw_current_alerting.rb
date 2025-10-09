# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AirNavigationService
        module Attributes
          class MsawCurrentAlerting < Eccairs::BaseEntity
            attribute_id 369
            xml_tag "MSAW_Current_Alerting"
            sequence 2
            validates_inclusion within: [1, 2, 99, 100]
          end
        end
      end
    end
  end
end
