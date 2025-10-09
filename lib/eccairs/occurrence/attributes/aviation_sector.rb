# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class AviationSector < Eccairs::Base::Entity
        attribute_id 1088
        xml_tag "Aviation_Sector"
        sequence 51
        validates_inclusion within: {
          YES: 1,
          NO: 2,
          VALUE_3: 3,
          VALUE_4: 4,
          VALUE_5: 5,
          VALUE_6: 6,
          VALUE_7: 7,
          VALUE_8: 8,
          VALUE_9: 9
        }
      end
    end
  end
end
