# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class OverallRepeatability < Eccairs::Base::Entity
        attribute_id 1078
        xml_tag "Overall_Repeatability"
        sequence 46
        validates_inclusion within: {
          YES: 1,
          NO: 2,
          VALUE_3: 3,
          VALUE_4: 4,
          VALUE_5: 5
        }
      end
    end
  end
end
