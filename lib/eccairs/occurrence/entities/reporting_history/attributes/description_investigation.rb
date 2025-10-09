# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module ReportingHistory
        module Attributes
          class DescriptionInvestigation < Eccairs::Base::StringEntity
            attribute_id 1067
            xml_tag "Description_Investigation"
            sequence 10
            wrap_text_in "PlainText"
          end
        end
      end
    end
  end
end
