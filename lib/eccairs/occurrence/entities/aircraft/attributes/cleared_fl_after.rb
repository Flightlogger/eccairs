# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class ClearedFlAfter < Eccairs::BaseEntity
            attribute_id 817
            xml_tag "Cleared_FL_After"
            sequence 54
            validates_numericality min: -999999, max: 999999, type: :decimal
          end
        end
      end
    end
  end
end
