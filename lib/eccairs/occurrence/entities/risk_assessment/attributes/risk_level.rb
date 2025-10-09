# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module RiskAssessment
        module Attributes
          class RiskLevel < Eccairs::Base::DecimalEntity
            attribute_id 940
            xml_tag "Risk_Level"
            sequence 2

            min -999999


            max 999999
          end
        end
      end
    end
  end
end
