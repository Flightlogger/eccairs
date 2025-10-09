# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class TotalInjuriesGround < Eccairs::Base::Entity
        attribute_id 463
        xml_tag "Total_Injuries-Ground"
        sequence 32
        validates_numericality min: 0, max: 100000, type: :integer
      end
    end
  end
end
