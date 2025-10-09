# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class TotalNumberOfPersons < Eccairs::Base::IntegerEntity
            attribute_id 152
            xml_tag "Total_Number_Of_Persons"
            sequence 18

            min 0


            max 999999
          end
        end
      end
    end
  end
end
