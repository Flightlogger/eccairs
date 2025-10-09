# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class AirTemperature < Eccairs::Base::Entity
        attribute_id 287
        xml_tag "Air_Temperature"
        sequence 8
        validates_numericality min: -1000, max: 100000, type: :decimal

        protected

        def additional_xml_attributes
          {Unit: "C"}
        end
      end
    end
  end
end
