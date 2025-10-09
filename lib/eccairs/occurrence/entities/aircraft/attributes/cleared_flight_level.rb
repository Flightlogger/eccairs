# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class ClearedFlightLevel < Eccairs::BaseEntity
            attribute_id 60
            xml_tag "Cleared_Flight_Level"
            sequence 10
            validates_numericality min: 0, max: 999999, type: :integer
          end
        end
      end
    end
  end
end
