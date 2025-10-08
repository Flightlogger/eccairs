# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class WindSpeed < Eccairs::BaseEntity
        attribute_id 322
        xml_tag "Wind_Speed"
        sequence 12
        validates_numericality min: -1000, max: 100000, type: :decimal

        protected

        def additional_xml_attributes
          { Unit: "kt" }
        end
      end
    end
  end
end
