# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module ReportingHistory
        module Attributes
          class OtherReportInform < Eccairs::BaseEntity
            attribute_id 1085
            xml_tag "Other_Report_Inform"
            sequence 16
            wrap_text_in "PlainText"
          end
        end
      end
    end
  end
end
