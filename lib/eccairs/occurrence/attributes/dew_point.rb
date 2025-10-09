# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class DewPoint < Eccairs::Base::Entity
        attribute_id 85
        xml_tag "Dew_Point"
        sequence 0
        unit "C"
        validates_numericality min: -100, max: 100, type: :decimal
      end
    end
  end
end
