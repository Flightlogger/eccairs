# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      class WeatherRelevant < BaseEntity
        attribute_id 606
        xml_tag "Weather_Relevant"
        sequence 38
        validates_inclusion within: {
          YES: 1,
          NO: 2,
          UNKNOWN: 99
        }
      end
    end
  end
end
