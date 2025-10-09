# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Attributes
      class LatitudeOfOcc < Eccairs::Base::DecimalEntity
        attribute_id 439
        xml_tag "Latitude_Of_Occ"
        sequence 19

        min -90.0


        max 90.0
      end
    end
  end
end
