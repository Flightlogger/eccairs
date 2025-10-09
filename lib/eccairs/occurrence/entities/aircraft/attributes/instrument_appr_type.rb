# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class InstrumentApprType < Eccairs::Base::EnumEntity
            attribute_id 165
            xml_tag "Instrument_Appr_Type"
            sequence 19
            allowed_values [100, 103, 104, 1, 101, 102, 13, 4, 2, 3, 5, 105, 106, 7, 10, 11, 109, 107, 108, 110, 97, 98, 99]
          end
        end
      end
    end
  end
end
