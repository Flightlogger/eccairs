# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      class OverallSeverityApplied < BaseEntity
        attribute_id 1076
        xml_tag "Overall_Severity_Applied"
        sequence 44
        validates_inclusion within: {
          YES: 1,
          NO: 2,
          VALUE_3: 3
        }
      end
    end
  end
end
