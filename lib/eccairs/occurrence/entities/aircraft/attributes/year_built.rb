# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class YearBuilt < Eccairs::Base::IntegerEntity
            attribute_id 327
            xml_tag "Year_Built"
            sequence 45

            min 0

            max 999999
          end
        end
      end
    end
  end
end
