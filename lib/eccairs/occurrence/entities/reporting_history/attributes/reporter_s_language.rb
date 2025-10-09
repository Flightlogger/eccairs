# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module ReportingHistory
        module Attributes
          class ReporterSLanguage < Eccairs::BaseEntity
            attribute_id 1091
            xml_tag "Reporter_S_Language"
            sequence 18
            validates_inclusion within: (1..66).to_a
          end
        end
      end
    end
  end
end
