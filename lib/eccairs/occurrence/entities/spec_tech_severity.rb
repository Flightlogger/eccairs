# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      class SpecTechSeverity < BaseEntity
        attribute_id 1080
        xml_tag "Spec_Tech_Severity"
        sequence 48
        validates_inclusion within: {
          YES: 1,
          NO: 2,
          VALUE_3: 3,
          VALUE_4: 4,
          VALUE_5: 5,
          VALUE_6: 6,
          VALUE_8: 8,
          VALUE_7: 7
        }
      end
    end
  end
end
