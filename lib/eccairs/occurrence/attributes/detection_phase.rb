# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class DetectionPhase < Eccairs::Base::Entity
        attribute_id 1072
        xml_tag "Detection_Phase"
        sequence 40
        validates_inclusion within: [1, 2, 3, 4, 5, 6, 8, 10, 11, 12, 16, 15, 14]
      end
    end
  end
end
