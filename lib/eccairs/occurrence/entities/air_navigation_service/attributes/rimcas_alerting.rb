# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AirNavigationService
        module Attributes
          class RimcasAlerting < Eccairs::Base::EnumEntity
            attribute_id 366
            xml_tag "RIMCAS_Alerting"
            sequence 1
            allowed_values [1, 2, 99, 100]
          end
        end
      end
    end
  end
end
