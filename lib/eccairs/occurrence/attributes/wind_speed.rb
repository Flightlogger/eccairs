# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class WindSpeed < Eccairs::Base::Entity
        attribute_id 322
        xml_tag "Wind_Speed"
        sequence 12
        unit "kt"
        validates_numericality min: -1000, max: 100000, type: :decimal
      end
    end
  end
end
