# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      class TotalMinorInjuriesGround < BaseEntity
        attribute_id 469
        xml_tag "Total_Minor_Injuries-Ground"
        sequence 33
        validates_numericality min: 0, max: 100000, type: :integer
      end
    end
  end
end
