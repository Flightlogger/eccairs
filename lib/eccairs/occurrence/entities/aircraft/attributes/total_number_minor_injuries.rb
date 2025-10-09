# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class TotalNumberMinorInjuries < Eccairs::Base::IntegerEntity
            attribute_id 187
            xml_tag "Total_Number_Minor_Injuries"
            sequence 23

            min 0

            max 999999
          end
        end
      end
    end
  end
end
