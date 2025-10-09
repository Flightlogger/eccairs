# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      module Aircraft
        module Attributes
          class YearBuilt < Eccairs::Base::Entity
            attribute_id 327
            xml_tag "Year_Built"
            sequence 45
            validates_numericality min: 0, max: 999999, type: :integer
          end
        end
      end
    end
  end
end
