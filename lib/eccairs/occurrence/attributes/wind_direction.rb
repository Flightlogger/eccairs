# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class WindDirection < Eccairs::Base::Entity
        attribute_id 320
        xml_tag "Wind_Direction"
        sequence 10
        unit "Degree(s)"

        validates_numericality min: -1000, max: 100000, type: :decimal
      end
    end
  end
end
