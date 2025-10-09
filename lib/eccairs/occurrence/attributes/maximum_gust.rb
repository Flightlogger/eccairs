# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class MaximumGust < Eccairs::Base::Entity
        attribute_id 176
        xml_tag "Maximum_Gust"
        sequence 5
        unit "kt"

        validates_numericality min: -1000, max: 100000, type: :decimal
      end
    end
  end
end
