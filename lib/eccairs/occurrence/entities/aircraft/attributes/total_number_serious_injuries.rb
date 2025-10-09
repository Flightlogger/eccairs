# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class TotalNumberSeriousInjuries < Eccairs::Base::IntegerEntity
            attribute_id 262
            xml_tag "Total_Number_Serious_Injuries"
            sequence 33

            min 0


            max 999999
          end
        end
      end
    end
  end
end
