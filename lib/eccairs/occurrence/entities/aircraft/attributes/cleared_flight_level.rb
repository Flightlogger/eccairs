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
          end
        end
      end
    end
  end
end

