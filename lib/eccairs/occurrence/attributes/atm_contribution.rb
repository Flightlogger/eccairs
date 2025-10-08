# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class AtmContribution < Eccairs::BaseEntity
        attribute_id 428
        xml_tag "ATM_Contribution"
        sequence 13
        validates_inclusion within: {
          NO: 2,
          VALUE_3: 3,
          VALUE_4: 4,
          VALUE_100: 100,
          VALUE_101: 101,
          UNKNOWN: 99
        }
      end
    end
  end
end
