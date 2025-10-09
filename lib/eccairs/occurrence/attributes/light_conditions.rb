# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class LightConditions < Eccairs::Base::Entity
        attribute_id 168
        xml_tag "Light_Conditions"
        sequence 4
        validates_inclusion within: {
          YES: 1,
          NO: 2,
          VALUE_3: 3,
          VALUE_5: 5,
          VALUE_4: 4,
          UNKNOWN: 99
        }
      end
    end
  end
end
