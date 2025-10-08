# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      class LatitudeOfOcc < BaseEntity
        attribute_id 439
        xml_tag "Latitude_Of_Occ"
        sequence 19
        validates_numericality min: -90.0, max: 90.0, type: :decimal
      end
    end
  end
end
