# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class NumberOfEngines < Eccairs::BaseEntity
            attribute_id 209
            xml_tag "Number_Of_Engines"
            sequence 24
            validates_numericality min: 0, max: 999999, type: :integer
          end
        end
      end
    end
  end
end
