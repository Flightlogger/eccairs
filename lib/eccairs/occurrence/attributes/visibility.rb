# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class Visibility < Eccairs::Base::Entity
        attribute_id 310
        xml_tag "Visibility"
        sequence 9
        unit "m"

        validates_numericality min: -1000, max: 100000, type: :decimal
      end
    end
  end
end
