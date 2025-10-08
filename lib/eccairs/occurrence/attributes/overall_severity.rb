# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class OverallSeverity < Eccairs::BaseEntity
        attribute_id 1077
        xml_tag "Overall_Severity"
        sequence 45
        validates_inclusion within: {
          YES: 1,
          NO: 2,
          VALUE_3: 3,
          VALUE_4: 4,
          VALUE_5: 5,
          VALUE_7: 7,
          VALUE_8: 8
        }
      end
    end
  end
end
