# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module ReportingHistory
        module Attributes
          class PartiesInformed < Eccairs::Base::EnumEntity
            attribute_id 1064
            xml_tag "Parties_Informed"
            sequence 7
            allowed_values [1, 2, 3, 4, 10, 11, 5, 6, 7, 8, 12, 9]
          end
        end
      end
    end
  end
end
