# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module ReportingHistory
        module Attributes
          class RiskAssessment < Eccairs::Base::StringEntity
            attribute_id 1068
            xml_tag "Risk_Assessment"
            sequence 11
            wrap_text_in "PlainText"
          end
        end
      end
    end
  end
end
