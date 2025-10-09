# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AirNavigationService
        module Attributes
          class RimcasAlerting < Eccairs::Base::Entity
            attribute_id 366
            xml_tag "RIMCAS_Alerting"
            sequence 1
            validates_inclusion within: [1, 2, 99, 100]
          end
        end
      end
    end
  end
end
