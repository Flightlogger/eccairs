# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      class HighestDamage < BaseEntity
        attribute_id 432
        xml_tag "Highest_Damage"
        sequence 16
        validates_inclusion within: {
          YES: 1,
          NO: 2,
          VALUE_3: 3,
          NOT_REPORTED: 98,
          UNKNOWN: 99
        }
      end
    end
  end
end
