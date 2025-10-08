# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class WindDirection < Eccairs::BaseEntity
        attribute_id 320
        xml_tag "Wind_Direction"
        sequence 10
        validates_numericality min: -1000, max: 100000, type: :decimal

        protected

        def additional_xml_attributes
          { Unit: "Degree(s)" }
        end
      end
    end
  end
end
