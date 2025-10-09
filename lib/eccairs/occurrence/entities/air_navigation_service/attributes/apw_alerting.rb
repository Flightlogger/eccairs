# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AirNavigationService
        module Attributes
          class ApwAlerting < Eccairs::Base::Entity
            attribute_id 363
            xml_tag "APW_Alerting"
            sequence 0
            validates_inclusion within: [1, 2, 99, 100]
          end
        end
      end
    end
  end
end
