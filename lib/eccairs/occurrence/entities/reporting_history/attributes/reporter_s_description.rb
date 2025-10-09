# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module ReportingHistory
        module Attributes
          class ReporterSDescription < Eccairs::BaseEntity
            attribute_id 1092
            xml_tag "Reporter_S_Description"
            sequence 19
            wrap_text_in "PlainText"
          end
        end
      end
    end
  end
end
