# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class GroundSeverity < Eccairs::Base::Entity
        attribute_id 1074
        xml_tag "Ground_Severity"
        sequence 42
        validates_inclusion within: {
          YES: 1,
          NO: 2,
          VALUE_3: 3,
          VALUE_4: 4,
          VALUE_5: 5,
          VALUE_6: 6,
          VALUE_7: 7,
          VALUE_8: 8
        }
      end
    end
  end
end
