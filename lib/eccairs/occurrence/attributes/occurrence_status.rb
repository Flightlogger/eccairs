# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class OccurrenceStatus < Eccairs::BaseEntity
        attribute_id 455
        xml_tag "Occurrence_Status"
        sequence 27
        validates_inclusion within: {
          VALUE_5: 5,
          NO: 2,
          YES: 1,
          VALUE_6: 6,
          VALUE_3: 3,
          VALUE_4: 4
        }
      end
    end
  end
end
