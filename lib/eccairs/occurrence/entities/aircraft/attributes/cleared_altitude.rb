# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class ClearedAltitude < Eccairs::Base::Entity
            attribute_id 58
            xml_tag "Cleared_Altitude"
            sequence 9
            unit "ft"

            validates_numericality min: -999999, max: 999999, type: :decimal
          end
        end
      end
    end
  end
end
