# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module RiskAssessment
        module Attributes
          class ErcsFinalBS < Eccairs::Base::IntegerEntity
            attribute_id 1107
            xml_tag "ERCS_Final_B_S"
            sequence 17

            min 0


            max 999999
          end
        end
      end
    end
  end
end
