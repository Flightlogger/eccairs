# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class EffectOnAtmService < Eccairs::BaseEntity
        attribute_id 436
        xml_tag "Effect_On_ATM_Service"
        sequence 18
        validates_inclusion within: {
          VALUE_4: 4,
          VALUE_3: 3,
          NO: 2,
          YES: 1,
          VALUE_5: 5,
          VALUE_7: 7,
          VALUE_6: 6
        }
      end
    end
  end
end
