# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class NumberOfEngines < Eccairs::Base::IntegerEntity
            attribute_id 209
            xml_tag "Number_Of_Engines"
            sequence 24

            min 0

            max 999999
          end
        end
      end
    end
  end
end
