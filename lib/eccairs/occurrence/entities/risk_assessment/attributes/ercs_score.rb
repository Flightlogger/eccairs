# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module RiskAssessment
        module Attributes
          class ErcsScore < Eccairs::Base::EnumEntity
            attribute_id 1095
            xml_tag "ERCS_Score"
            sequence 5
            allowed_values (1..51).to_a
          end
        end
      end
    end
  end
end
