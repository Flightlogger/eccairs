# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module RiskAssessment
        module Attributes
          class RiskMethod < Eccairs::Base::EnumEntity
            attribute_id 939
            xml_tag "Risk_Method"
            sequence 1
            allowed_values [1, 8, 5, 6, 9, 7, 3, 2, 10, 4]
          end
        end
      end
    end
  end
end
