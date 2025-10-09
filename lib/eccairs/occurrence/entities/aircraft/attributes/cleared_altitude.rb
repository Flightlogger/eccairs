# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class ClearedAltitude < Eccairs::Base::DecimalEntity
            attribute_id 58
            xml_tag "Cleared_Altitude"
            sequence 9
            unit "ft"

            min(-999999)

            max 999999
          end
        end
      end
    end
  end
end
