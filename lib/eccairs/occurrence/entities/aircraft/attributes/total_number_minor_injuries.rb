# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class TotalNumberMinorInjuries < Eccairs::BaseEntity
            attribute_id 187
            xml_tag "Total_Number_Minor_Injuries"
            sequence 23
            validates_numericality min: 0, max: 999999, type: :integer
          end
        end
      end
    end
  end
end
