# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module ReportingHistory
        module Attributes
          class ExportControl < Eccairs::BaseEntity
            attribute_id 1086
            xml_tag "Export_Control"
            sequence 17
            validates_inclusion within: [1, 2]
          end
        end
      end
    end
  end
end
