# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      class TotalFatalitiesGround < BaseEntity
        attribute_id 460
        xml_tag "Total_Fatalities_Ground"
        sequence 30
        validates_numericality min: 0, max: 100000, type: :integer
      end
    end
  end
end
