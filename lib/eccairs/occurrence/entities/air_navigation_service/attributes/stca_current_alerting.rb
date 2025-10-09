# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AirNavigationService
        module Attributes
          class StcaCurrentAlerting < Eccairs::Base::Entity
            attribute_id 379
            xml_tag "STCA_Current_Alerting"
            sequence 4
            validates_inclusion within: [1, 2, 99, 100]
          end
        end
      end
    end
  end
end
