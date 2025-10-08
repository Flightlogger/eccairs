# frozen_string_literal: true

module Eccairs
  module Occurrence
    module Entities
      class LongitudeOfOcc < BaseEntity
        attribute_id 444
        xml_tag "Longitude_Of_Occ"
        sequence 21
        validates_numericality min: -180.0, max: 180.0, type: :decimal
      end
    end
  end
end
