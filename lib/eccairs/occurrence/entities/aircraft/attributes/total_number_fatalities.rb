# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class TotalNumberFatalities < Eccairs::Base::IntegerEntity
            attribute_id 114
            xml_tag "Total_Number_Fatalities"
            sequence 13

            min 0

            max 999999
          end
        end
      end
    end
  end
end
