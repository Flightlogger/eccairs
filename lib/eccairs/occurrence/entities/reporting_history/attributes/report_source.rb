# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module ReportingHistory
        module Attributes
          class ReportSource < Eccairs::Base::EnumEntity
            attribute_id 476
            xml_tag "Report_Source"
            sequence 2
            allowed_values [1, 5, 2, 4, 6, 3]
          end
        end
      end
    end
  end
end
