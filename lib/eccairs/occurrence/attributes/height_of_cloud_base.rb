# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class HeightOfCloudBase < Eccairs::Base::Entity
        attribute_id 140
        xml_tag "Height_Of_Cloud_Base"
        sequence 3
        validates_numericality min: -1000, max: 100000, type: :decimal

        protected

        def additional_xml_attributes
          {Unit: "ft"}
        end
      end
    end
  end
end
