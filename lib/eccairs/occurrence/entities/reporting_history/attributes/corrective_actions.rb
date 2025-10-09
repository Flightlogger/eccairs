# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module ReportingHistory
        module Attributes
          class CorrectiveActions < Eccairs::Base::StringEntity
            attribute_id 1069
            xml_tag "Corrective_Actions"
            sequence 12
            wrap_text_in "PlainText"
          end
        end
      end
    end
  end
end
