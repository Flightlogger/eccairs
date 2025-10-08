# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      class TotalInjuriesGround < BaseEntity
        attribute_id 463
        xml_tag "Total_Injuries-Ground"
        sequence 32
        validates_numericality min: 0, max: 100000, type: :integer
      end
    end
  end
end
