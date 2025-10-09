# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module AerodromeGeneral
        module Attributes
          class LocationIndicator < Eccairs::Base::StringEntity
            attribute_id 5
            xml_tag "Location_Indicator"
            sequence 4
          end
        end
      end
    end
  end
end
