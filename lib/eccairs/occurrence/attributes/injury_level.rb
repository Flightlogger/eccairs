# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class InjuryLevel < Eccairs::Base::Entity
        attribute_id 451
        xml_tag "Injury_Level"
        sequence 23
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
