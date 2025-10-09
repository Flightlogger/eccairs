# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class TotalNumberFatalities < Eccairs::Base::Entity
            attribute_id 114
            xml_tag "Total_Number_Fatalities"
            sequence 13
            validates_numericality min: 0, max: 999999, type: :integer
          end
        end
      end
    end
  end
end
