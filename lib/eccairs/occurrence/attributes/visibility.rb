# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class Visibility < Eccairs::Base::Entity
        attribute_id 310
        xml_tag "Visibility"
        sequence 9
        validates_numericality min: -1000, max: 100000, type: :decimal

        protected

        def additional_xml_attributes
          {Unit: "m"}
        end
      end
    end
  end
end
