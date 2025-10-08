# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class MaximumGust < Eccairs::BaseEntity
        attribute_id 176
        xml_tag "Maximum_Gust"
        sequence 5
        validates_numericality min: -1000, max: 100000, type: :decimal

        protected

        def additional_xml_attributes
          { Unit: "kt" }
        end
      end
    end
  end
end
