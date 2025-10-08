# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class TotalSeriousInjuriesGround < Eccairs::BaseEntity
        attribute_id 472
        xml_tag "Total_Serious_Injuries-Ground"
        sequence 34
        validates_numericality min: 0, max: 100000, type: :integer
      end
    end
  end
end
