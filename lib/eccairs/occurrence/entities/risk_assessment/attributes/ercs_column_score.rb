# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module RiskAssessment
        module Attributes
          class ErcsColumnScore < Eccairs::Base::IntegerEntity
            attribute_id 1094
            xml_tag "ERCS_Column_Score"
            sequence 4

            min 0


            max 999999
          end
        end
      end
    end
  end
end
