# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module ReportingHistory
        module Attributes
          class RiskClassification < Eccairs::Base::StringEntity
            attribute_id 1065
            xml_tag "Risk_Classification"
            sequence 8
          end
        end
      end
    end
  end
end
