# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module RiskAssessment
        module Attributes
          class Unspecified < Eccairs::Base::EnumEntity
            attribute_id 1105
            xml_tag "Unspecified"
            sequence 15
            allowed_values [1, 2, 3, 4, 5, 6]
          end
        end
      end
    end
  end
end
