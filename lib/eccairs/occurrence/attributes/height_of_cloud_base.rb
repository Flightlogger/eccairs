# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class HeightOfCloudBase < Eccairs::Base::DecimalEntity
        attribute_id 140
        xml_tag "Height_Of_Cloud_Base"
        sequence 3
        unit "ft"

        min(-1000)

        max 100000
      end
    end
  end
end
