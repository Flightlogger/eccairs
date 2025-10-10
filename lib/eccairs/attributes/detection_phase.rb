# frozen_string_literal: true

module Eccairs
  module Attributes
    class DetectionPhase < Eccairs::Base::EnumAttribute
      attribute_id 1072
      xml_tag "Detection_Phase"
      sequence 40
      allowed_values [1, 2, 3, 4, 5, 6, 8, 10, 11, 12, 16, 15, 14]
    end
  end
end
