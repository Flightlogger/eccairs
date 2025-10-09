# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module ReportingHistory
        module Attributes
          class ReporterSLanguage < Eccairs::Base::EnumEntity
            attribute_id 1091
            xml_tag "Reporter_S_Language"
            sequence 18
            allowed_values (1..66).to_a
          end
        end
      end
    end
  end
end
