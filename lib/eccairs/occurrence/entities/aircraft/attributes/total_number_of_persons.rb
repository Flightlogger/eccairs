# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class TotalNumberOfPersons < Eccairs::BaseEntity
            attribute_id 152
            xml_tag "Total_Number_Of_Persons"
            sequence 18
            validates_numericality min: 0, max: 999999, type: :integer
          end
        end
      end
    end
  end
end
